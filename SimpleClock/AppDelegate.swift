//
//  AppDelegate.swift
//  SimpleClock
//
//  Created by zhuyie on 2021/11/24.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()

        // Create the window and set the content view.
        let windowWidth: CGFloat = 800
        let windowHeight: CGFloat = 600
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: windowWidth, height: windowHeight),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.isReleasedWhenClosed = false
        window.contentView = NSHostingView(rootView: contentView)

        // Move the window to the built-in screen.
        var screen = NSScreen.main
        let descKey: NSDeviceDescriptionKey = NSDeviceDescriptionKey(rawValue: "NSScreenNumber")
        let builtinScreens = NSScreen.screens.filter {
            guard let deviceID = $0.deviceDescription[descKey] as? NSNumber else { return false }
            return CGDisplayIsBuiltin(deviceID.uint32Value) != 0
        }
        if builtinScreens.count > 0 {
            screen = builtinScreens[0]
        }
        var origin = screen!.visibleFrame.origin
        origin.x += (screen!.visibleFrame.width - windowWidth) / 2
        origin.y += (screen!.visibleFrame.height - windowHeight) / 2
        window.setFrameOrigin(origin)

        // Show the window
        window.makeKeyAndOrderFront(nil)

        // When the app was launched from Launchpad, sometimes the window
        // moved to another screen for unknown reason.
        // To workaround this issue, we call setFrameOrigin again.
        window.setFrameOrigin(origin)

        // Takes the window into fullscreen mode.
        window.toggleFullScreen(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

}
