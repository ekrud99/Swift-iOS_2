//
//  AppDelegate.swift
//  reviewEx01
//
//  Created by 최다경 on 2022/03/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    //전역변수 선언
    var mySidemenu: MySideMenuNavigationController? = nil
    var mainVC: ViewController? = nil
    var ytUrl: String? = nil
    
    let names:[String] = ["TaeYeon", "IU", "AESPA", "GAYLE", "Sia"]
    let arts:[String] = ["Rain", "Strawberry Moon", "Savage", "abcdefu", "Snowman"]
    let images:[String] = ["image2", "image3", "image4", "image5", "image6"]

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
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

