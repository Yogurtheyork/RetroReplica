#!/bin/bash
# 在一般 macOS 終端機執行；不需要 GitHub Actions。
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p artifacts
# 可傳入 iPhone 的 UDID；預設使用目前開機的模擬器。
device="${1:-booted}"
xcrun simctl list devices available
if [ "$device" != booted ]; then
    state="$(xcrun simctl list devices booted)"
    if [[ "$state" != *"$device"* ]]; then
        xcrun simctl boot "$device"
    fi
fi
xcrun simctl bootstatus "$device" -b
xcodebuild -project Retro.xcodeproj -scheme Retro \
    -configuration Debug -sdk iphonesimulator \
    -destination "generic/platform=iOS Simulator" \
    -derivedDataPath "$PWD/artifacts/DerivedData" \
    CODE_SIGNING_ALLOWED=NO build > artifacts/build.log 2>&1
app="$PWD/artifacts/DerivedData/Build/Products/Debug-iphonesimulator/Retro.app"
bundle_id=$(/usr/libexec/PlistBuddy -c 'Print CFBundleIdentifier' "$app/Info.plist")
xcrun simctl install "$device" "$app"
xcrun simctl launch "$device" "$bundle_id"
open -a Simulator
printf '\n請確認畫面載入，測試上下與左右滑動，再回到終端機按 Enter 拍攝首頁。\n'
read -r
xcrun simctl io "$device" screenshot "$PWD/artifacts/retro-home.png"
printf '截圖已儲存：%s/artifacts/retro-home.png\n' "$PWD"
