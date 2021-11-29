//
//  AppDelegate.swift
//  SmallWorld-iOS
//
//  Created by Carlos Villamizar on 23/11/21.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        
        window?.setRootViewController(UINavigationController(rootViewController: GeneralRoute.home.scene!), options: .init(direction: .toTop, style: .easeInOut))
        
        return true
    }
}
