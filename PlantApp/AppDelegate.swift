//
//  AppDelegate.swift
//  PlantApp
//
//  Created by Eldorbek on 05/07/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()

        if UserDefaults.standard.bool(forKey: "IS_USER_LOGIN") {
            let navigationController = UINavigationController(rootViewController: TabbarController())
            window?.rootViewController = navigationController
        } else {
            let navigationController = UINavigationController(rootViewController: OnboardingViewController())
            window?.rootViewController = navigationController
        }

        return true
    }
}

