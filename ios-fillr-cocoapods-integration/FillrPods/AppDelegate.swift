//
//  AppDelegate.swift
//  FillrPods
//
//  Created by Patel, Diptesh | AMB on 23/8/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let remoteDepAuth = FillrWidgetAuth(username: "USERNAME", password: "PASSWORD")
        let fillrConfig = FillrConfig(devKey: "DEV_KEY", secretKey: "SECRET_KEY", remoteDependencyAuth: remoteDepAuth)
        let fillr = Fillr.sharedInstance()

        fillr?.initialise(with: fillrConfig)
        fillr?.enabled = true
        fillr?.debugMode = true
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

