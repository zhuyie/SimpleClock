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
        NSScreen.screens.forEach {
            // print($0.localizedName)
            if $0.localizedName == "Built-in Retina Display" {
                screen = $0
            }
        }
        var origin = screen!.visibleFrame.origin
        origin.x += (screen!.visibleFrame.width - windowWidth) / 2
        origin.y += (screen!.visibleFrame.height - windowHeight) / 2
        window.setFrameOrigin(origin)
        
        // Show the window
        window.makeKeyAndOrderFront(nil)

        // Takes the window into fullscreen mode.
        window.toggleFullScreen(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

}
