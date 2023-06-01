//
//  WeatherImagesEnum.swift
//  ArkanitTZ
//
//  Created by Сергей Абросов on 31.05.2023.
//

import Foundation
import UIKit

enum WeatherStatuses {
  case sunny
  case rainy
  case cloudy
  
  var weather: UIImage {
    switch self {
    case .sunny: return UIImage(named: "Sunny") ?? UIImage()
    case .rainy: return UIImage(named: "Rainy") ?? UIImage()
    case .cloudy: return UIImage(named: "Cloudy") ?? UIImage()
    }
  }
}
