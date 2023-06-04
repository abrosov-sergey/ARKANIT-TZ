//
//  AppDelegate.swift
//  ArkanitTZ
//
//  Created by Сергей Абросов on 29.05.2023.
//

import UIKit
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  let window = UIWindow(frame: UIScreen.main.bounds)
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
  ) -> Bool {
    window.backgroundColor = UIColor.black
    
    var navController = UINavigationController(rootViewController: Assembly.resolver.resolve(SearchCityScreenModule.self)!)
    navController.navigationBar.backgroundColor = .black
    
    window.rootViewController = navController
    window.makeKeyAndVisible()
    return true
  }

}
