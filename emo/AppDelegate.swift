//
//  AppDelegate.swift
//  emo
//
//  Created by Jason Steele on 1/21/18.
//  Copyright © 2018 Jason Steele. All rights reserved.
//

import CocoaLumberjack
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // Do any additional setup after loading the view, typically from a nib.

        // Set up application logging
        DDLog.add(DDASLLogger.sharedInstance)
        DDASLLogger.sharedInstance.logFormatter = CustomDDLogFormatter(compact: true)

        let fileLogger: DDFileLogger = DDFileLogger() // File Logger
        fileLogger.rollingFrequency = TimeInterval(60 * 60 * 24) // 24 hours
        fileLogger.logFileManager.maximumNumberOfLogFiles = 7
        fileLogger.logFormatter = CustomDDLogFormatter()
        DDLog.add(fileLogger)
        defaultDebugLevel = DDLogLevel.info

        return true
    }

    func applicationWillResignActive(_: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain
        // types of temporary interruptions (such as an incoming phone call or SMS message) or when the user
        // quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks.
        // Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough
        // application state information to restore your application to its current state in case it is terminated
        // later.
        // If your application supports background execution, this method is called instead of
        // applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of
        // the changes made on entering the background.
    }

    func applicationDidBecomeActive(_: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the
        // application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also
        // applicationDidEnterBackground:.
    }
}
