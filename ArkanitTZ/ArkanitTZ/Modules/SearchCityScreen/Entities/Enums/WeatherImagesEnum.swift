//
//  WeatherImagesEnum.swift
//  ArkanitTZ
//
//  Created by Сергей Абросов on 31.05.2023.
//

import Foundation
import UIKit

enum WeatherStatuses {
  case emptyValue
  case sunny
  case rainy
  case cloudy
  case clear
  case thunderstorm
  case snow
  case extreme
  
  var weather: UIImage {
    switch self {
    case .emptyValue: return UIImage()
    case .sunny: return UIImage(named: "Sunny") ?? UIImage()
    case .rainy: return UIImage(named: "Rainy") ?? UIImage()
    case .cloudy: return UIImage(named: "Cloudy") ?? UIImage()
    case .clear: return UIImage(named: "Clear") ?? UIImage()
    case .thunderstorm: return UIImage(named: "Thunderstorm") ?? UIImage()
    case .snow: return UIImage(named: "Snow") ?? UIImage()
    case .extreme: return UIImage(named: "Extreme") ?? UIImage()
    }
  }
}
