//
//  SearchCityScreenInteractor.swift
//  ArkanitTZ
//
//  Created by Сергей Абросов on 29.05.2023.
//

import Foundation

protocol SearchCityScreenInteractorPresenterInput {
  func fetchWeather(cityName: String)
}

// MARK: - SearchCityScreenInteractor
 
final class SearchCityScreenInteractor {
  
  // MARK: - Properties
  
  private let weatherService: WeatherService
  private let presenter: SearchCityScreenPresenterInteractorInput
  
  // MARK: - Setup
  
  init(weatherService: WeatherService, presenter: SearchCityScreenPresenter) {
    self.weatherService = weatherService
    self.presenter = presenter
  }
}

// MARK: - SearchCityScreenInteractorPresenterInput

extension SearchCityScreenInteractor: SearchCityScreenInteractorPresenterInput {
  func fetchWeather(cityName: String) {
    var model = CityInfoModel(cityName: cityName, weatherStatus: WeatherStatuses.emptyValue, temperature: "none")
    
    weatherService.fetchWeatherByCityName(cityName: cityName) { temperature, weatherStatus in
        model.temperature = temperature
        
        switch weatherStatus {
        case "Clouds": model.weatherStatus = .cloudy
        case "Sunny": model.weatherStatus = .sunny
        case "Rain": model.weatherStatus = .rainy
        case "Clear": model.weatherStatus = .clear
        case "Thunderstorm": model.weatherStatus = .thunderstorm
        case "Snow": model.weatherStatus = .snow
        case "Extreme": model.weatherStatus = .extreme
        default: model.weatherStatus = .clear
        }
      DispatchQueue.main.sync {
        self.presenter.addNewCity(model: model)
      }
    } failed: { message in
      DispatchQueue.main.async {
        print(message)
        self.presenter.addNewCity(model: model)
      }
    }
  }
}
