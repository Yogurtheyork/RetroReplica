"""Select an available iPhone on an installed iOS runtime >= iOS 17."""
import json
import re
import sys


def select_device(data):
    candidates = []
    for runtime, devices in data["devices"].items():
        match = re.fullmatch(r"com\.apple\.CoreSimulator\.SimRuntime\.iOS-(\d+)-(\d+)(?:-(\d+))?", runtime)
        if not match:
            continue
        version = tuple(int(part or 0) for part in match.groups())
        if version < (17, 0, 0):
            continue
        for device in devices:
            if device.get("isAvailable") and device["name"].startswith("iPhone"):
                candidates.append((version, device["name"], device["udid"]))
    if not candidates:
        raise SystemExit("No available iPhone simulator with iOS >= 17.0")
    return max(candidates)[2]


if __name__ == "__main__":
    print(select_device(json.load(sys.stdin)))
