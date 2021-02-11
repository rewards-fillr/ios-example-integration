//
//  AppDelegate.swift
//  ios-example-integration
//
//  Created by Alex Bin Zhao on 11/2/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        setupFillr()
        
        return true
    }
    
    func setupFillr() {
        let fillrDevKey = "Fillr Dev Key"
        let fillrSecretKey = "Fillr Secret Key"
        let cartScraperUserName = "Cart Scraper Username"
        let cartScraperPassword = "Cart Scraper Password"
        let fillr = Fillr.sharedInstance()
        let cartScraperAuth = FillrWidgetAuth(username: cartScraperUserName, password: cartScraperPassword)
        let fillrConfig = FillrConfig(devKey: fillrDevKey, secretKey: fillrSecretKey, cartScraperAuth: cartScraperAuth)
        fillr?.initialise(with: fillrConfig)
        fillr?.fillProvider = HeadlessBaseFillProvider.sharedInstance()
        fillr?.setHeadlessFillEnabled(true)
        fillr?.enabled = true
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

