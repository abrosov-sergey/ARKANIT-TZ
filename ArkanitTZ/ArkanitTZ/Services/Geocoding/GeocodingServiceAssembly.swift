//
//  GeocodingServiceAssembly.swift
//  ArkanitTZ
//
//  Created by Сергей Абросов on 01.06.2023.
//

import Foundation
import Swinject

// MARK: - GeocodingServiceAssembly

final class GeocodingServiceAssembly: Swinject.Assembly {
  func assemble(container: Swinject.Container) {
    container.register(GeocodingService.self) { resolver in
      return GeocodingService()
    }
  }
}
