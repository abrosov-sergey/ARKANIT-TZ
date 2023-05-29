//
//  AppDelegate.swift
//  ArkanitTZ
//
//  Created by Сергей Абросов on 29.05.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  let window = UIWindow(frame: UIScreen.main.bounds)
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
  ) -> Bool {
    window.backgroundColor = UIColor.white
    window.rootViewController = ViewController()
    window.makeKeyAndVisible()
    return true
  }

}
