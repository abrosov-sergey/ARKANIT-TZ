//
//  WeatherServiceAssembly.swift
//  ArkanitTZ
//
//  Created by Сергей Абросов on 01.06.2023.
//

import Foundation
import Swinject

// MARK: - WeatherServiceAssembly

final class WeatherServiceAssembly: Swinject.Assembly {
  func assemble(container: Swinject.Container) {
    container.register(WeatherService.self) { resolver in
      let geocodingService = resolver.resolve(GeocodingService.self)!
      return WeatherService(geocodingService: geocodingService)
    }
  }
}
