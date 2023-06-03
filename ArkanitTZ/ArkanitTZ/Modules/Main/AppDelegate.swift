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
    
//    let serv = Assembly.resolver.resolve(WeatherService.self)!
//    print(InfoAboutAllCities.shared.allCities)
//    var setOfStatuses = Set<String>()
//    for i in InfoAboutAllCities.shared.allCities {
//      serv.fetchWeatherByCityName(cityName: i.cityEn) { temp, status in
//        setOfStatuses.insert(status)
//      } failed: { _ in
//
//      }
//    }
//    print(setOfStatuses)

    window.rootViewController = UINavigationController(rootViewController: Assembly.resolver.resolve(SearchCityScreenModule.self)!)
    window.makeKeyAndVisible()
    return true
  }

}
