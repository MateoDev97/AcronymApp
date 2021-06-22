//
//  AppDelegate.swift
//  AcronymApp
//
//  Created by Mateo Ortiz on 21/06/21.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    var globalNavigationController: UINavigationController?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let rootViewController = SearchListRouter.createSearchListModule()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        globalNavigationController = navigationController
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()


        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        
        return true
    }

    


}

