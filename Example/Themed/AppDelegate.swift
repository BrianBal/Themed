//
//  AppDelegate.swift
//  Themed
//
//  Created by Brian Bal on 08/17/2017.
//  Copyright (c) 2017 Brian Bal. All rights reserved.
//

import UIKit
import Themed

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        setupTheme()
        
        // setup appearance defaults with styles (wont auto update styled views)
        // UINavigationBar.appearance().styles = ["navbar"]
        
        let nav = UINavigationController(rootViewController: ViewController())
        nav.navigationBar.styles = ["navbar"]
        
        window = UIWindow()
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func setupTheme() {
        
        Theme.add("navbar") { (view) in
            if let navbar = view as? UINavigationBar {
                navbar.barTintColor = .blue
                navbar.tintColor = .white
                navbar.titleTextAttributes = [
                    NSFontAttributeName: UIFont.preferredFont(forTextStyle: UIFontTextStyle.title2),
                    NSForegroundColorAttributeName: UIColor.white
                ]
            }
        }
        
        Theme.add("page") { (view) in
            view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        }
        
        Theme.add("title") { (view) in
            if let label = view as? UILabel {
                label.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
                label.textColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0)
            }
        }
        
        Theme.add("body") { (view) in
            if let label = view as? UILabel {
                label.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
                label.textColor = .black
            }
        }
        
        Theme.add("center") { (view) in
            if let label = view as? UILabel {
                label.textAlignment = .center
            }
        }
        
        Theme.add("truncate") { (view) in
            if let label = view as? UILabel {
                label.lineBreakMode = .byTruncatingTail
            }
        }
        
    }

}

