//
//  SearchCityScreenInteractor.swift
//  ArkanitTZ
//
//  Created by Сергей Абросов on 29.05.2023.
//

import Foundation

protocol SearchCityScreenInteractorPresenterInput {
  func fetchWeather(cityName: String) -> CityInfoModel
}

// MARK: - SearchCityScreenInteractor
 
final class SearchCityScreenInteractor {
  
  // MARK: - Properties
  
  private let weatherService: WeatherService
  private let presenter: SearchCityScreenPresenter
  private var arrayOfCitiesInfo = [CityInfoModel]()
  
  // MARK: - Setup
  
  init(weatherService: WeatherService, presenter: SearchCityScreenPresenter) {
    self.weatherService = weatherService
    self.presenter = presenter
  }
}

// MARK: - SearchCityScreenInteractorPresenterInput

extension SearchCityScreenInteractor: SearchCityScreenInteractorPresenterInput {
  func fetchWeather(cityName: String) -> CityInfoModel {
    var model = CityInfoModel(cityName: cityName, weatherStatus: WeatherStatuses.emptyValue, temperature: "none")
    
    weatherService.fetchWeatherByCityName(cityName: cityName) { temperature, weatherStatus in
      model.temperature = temperature
      
      switch weatherStatus {
      case "Clouds": model.weatherStatus = .cloudy
      case "Sunny": model.weatherStatus = .sunny
      case "Rainy": model.weatherStatus = .rainy
      default: model.weatherStatus = .emptyValue
      }
    } failed: { message in
      print(message)
    }
    
    return model
  }
}
