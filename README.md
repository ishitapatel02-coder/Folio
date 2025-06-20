# CallKit Demo

This repository contains a minimal example demonstrating how to use Apple's CallKit framework.
The Swift implementation is located in `CallKitDemo/CallKitManager.swift` and provides a simple
`CallKitManager` class for starting and ending calls.

## Usage
1. Add the `CallKitDemo` folder to your Xcode project.
2. Import the file or module into your app target.
3. Use `CallKitManager.shared.startCall(handle:)` to start a call and `CallKitManager.shared.end(call:)` to end it.

CallKit functionality must be tested on a real iOS device. Make sure to configure your
`Info.plist` with the required background modes and permissions for VoIP.
