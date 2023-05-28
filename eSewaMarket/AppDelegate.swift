//
//  AppDelegate.swift
//  eSewaMarket
//
//  Created by Omar  on 4/12/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window?.rootViewController = UINavigationController(rootViewController: HomeController())
        self.window?.makeKeyAndVisible()
        return true
    }

}

