//
//  AppDelegate.swift
//  Mixtapes
//
//  Created by Attila Györffy on 26/10/14.
//  Copyright (c) 2014 mixtapes. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var theLabel: NSTextField!
    @IBOutlet weak var theButton: NSButton!
    
    @IBOutlet var statusMenu: NSMenu!
    var statusItem: NSStatusItem
    var menu : NSMenu = NSMenu()
    
    override init() {
        let lengthSquare: CGFloat = -2 // TODO: Workaround for Xcode 6 Beta, should actually be: NSSquareStatusItemLength (see http://stackoverflow.com/questions/24024723/swift-using-nsstatusbar-statusitemwithlength-and-nsvariablestatusitemlength)
        self.statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(lengthSquare)
    }
    
    override func awakeFromNib() {
        self.statusItem.menu = self.statusMenu
        self.statusItem.highlightMode = true
    }

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        updateStatusItem()
//        self.window!.orderOut(self)
    }
    
    func updateStatusItem()
    {
        self.statusItem.title = nil
        
        var icon = NSImage(named: "mixtapes2.icns")
        icon?.size = NSSize(width: 16, height: 16)
        icon?.setTemplate(true)
        
        self.statusItem.image = icon
        
        // Quit from menu
        
        menu.addItem(NSMenuItem(title: "Log in", action: "login", keyEquivalent: ""))
        menu.addItem(NSMenuItem.separatorItem())
        menu.addItem(NSMenuItem(title: "Quit", action: "quit", keyEquivalent: ""))
        self.statusItem.menu = menu
    }
    
    func login() {
        theLabel.stringValue = "Now we should log you in somehow..."
    }
    
    func setWindowVisible(sender: AnyObject){
        self.window!.orderFront(self)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func quit() {
        NSApplication.sharedApplication().terminate(self)
    }


}

