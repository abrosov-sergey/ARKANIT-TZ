//
//  Assembly.swift
//  ArkanitTZ
//
//  Created by Сергей Абросов on 29.05.2023.
//

import Foundation
import Swinject

@objc public class Assembly: NSObject {
  private static let assemblies: [Swinject.Assembly] = [
    GeocodingServiceAssembly(),
    WeatherServiceAssembly(),
    DetailedInfoScreenAssembly(),
    SearchCityScreenAssembly(),
  ]

  private static let container = Container()
  private static let assembler = Assembler(assemblies, container: container)

  static let resolver = (assembler.resolver as! Container).synchronize()
}
