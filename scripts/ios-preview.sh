#!/bin/bash
set -euo pipefail

mkdir -p artifacts
# tee retains both successful output and errors if a command fails.
exec > >(tee artifacts/preview.log) 2>&1

ls -d /Applications/Xcode*.app
xcode-select -p
xcodebuild -version
xcodebuild -showsdks
xcrun simctl list
xcrun simctl list devices available --json > artifacts/devices.json
SIMULATOR_ID=$(python3 scripts/select_simulator.py < artifacts/devices.json)
echo "Selected simulator: $SIMULATOR_ID"

xcodegen generate
xcodebuild -project RetroReplica.xcodeproj -scheme RetroReplica \
  -configuration Debug -sdk iphonesimulator \
  -destination "platform=iOS Simulator,id=$SIMULATOR_ID" \
  -derivedDataPath DerivedData CODE_SIGNING_ALLOWED=NO build \
  2>&1 | tee artifacts/build.log

# A selected device may already be running.
if ! xcrun simctl list devices booted --json | python3 -c \
  'import json,sys; d=json.load(sys.stdin); sys.exit(not any(x["udid"] == sys.argv[1] for v in d["devices"].values() for x in v))' "$SIMULATOR_ID"; then
  xcrun simctl boot "$SIMULATOR_ID"
fi
xcrun simctl bootstatus "$SIMULATOR_ID" -b
xcrun simctl ui "$SIMULATOR_ID" appearance dark
xcrun simctl install "$SIMULATOR_ID" DerivedData/Build/Products/Debug-iphonesimulator/RetroReplica.app
xcrun simctl launch "$SIMULATOR_ID" com.yogurtheyork.RetroReplica
# Allow the first SwiftUI frame to render before capturing.
sleep 5
xcrun simctl io "$SIMULATOR_ID" screenshot artifacts/retro-home.png
test -s artifacts/retro-home.png
