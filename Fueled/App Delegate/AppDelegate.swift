//
//  AppDelegate.swift
//  Fueled
//
//  Created by Prince on 06/10/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    //MARK:- App Delegate Methods
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setNavigationBarAppearance()
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }

    //MARK: Set NavigationBar
    func setNavigationBarAppearance() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().backgroundColor = .orange
        UINavigationBar.appearance().largeTitleTextAttributes =
            [ NSAttributedString.Key.foregroundColor: UIColor.white,
              NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24.0)]
        UINavigationBar.appearance().titleTextAttributes =
            [ NSAttributedString.Key.foregroundColor: UIColor.white,
              NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18.0)]
    }

}

