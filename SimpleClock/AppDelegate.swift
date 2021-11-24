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
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.isReleasedWhenClosed = false
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        
        // Move the window to the built-in screen.
        var screen = NSScreen.main
        NSScreen.screens.forEach {
            // print($0.localizedName)
            if $0.localizedName == "Built-in Retina Display" {
                screen = $0
            }
        }
        window.setFrameOrigin(screen!.visibleFrame.origin)

        // Show the window
        window.makeKeyAndOrderFront(nil)

        // Takes the window into fullscreen mode.
        window.toggleFullScreen(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

}
