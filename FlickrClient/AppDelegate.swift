//
//  AppDelegate.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 16/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    let feedVC = FeedFactory().create()
    let navigationVC = UINavigationController(rootViewController: feedVC)
    navigationVC.navigationBar.isTranslucent = false
    window?.rootViewController = navigationVC
    window?.makeKeyAndVisible()
    return true
  }
  
}

