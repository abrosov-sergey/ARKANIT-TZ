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
    window.backgroundColor = UIColor.white
    
    let serv = Assembly.resolver.resolve(WeatherService.self)!
    
    serv.fetchWeatherByCityName(cityName: "London") { _, _ in
      
    } failed: { _ in
      
    }


    window.rootViewController = UINavigationController(rootViewController: Assembly.resolver.resolve(SearchCityScreenModule.self)!)
    window.makeKeyAndVisible()
    return true
  }

}
