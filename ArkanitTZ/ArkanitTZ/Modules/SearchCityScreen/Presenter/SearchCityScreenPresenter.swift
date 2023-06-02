//
//  SearchCityScreenPresenter.swift
//  ArkanitTZ
//
//  Created by Сергей Абросов on 29.05.2023.
//

import Foundation

protocol SearchCityScreenPresenterViewInput {
  func fetchWeather(cityName: String) -> CityInfoModel
}

// MARK: - SearchCityScreenPresenter
 
final class SearchCityScreenPresenter {
  
  // MARK: - Properties
  
  var view: SearchCityScreenView?
  var router: SearchCityScreenRouter?
  var interactor: SearchCityScreenInteractorPresenterInput?
}

// MARK: - SearchCityScreenPresenterViewInput

extension SearchCityScreenPresenter: SearchCityScreenPresenterViewInput {
  func fetchWeather(cityName: String) -> CityInfoModel {
    return interactor?.fetchWeather(cityName: cityName) ??
           CityInfoModel(cityName: "cityName", weatherStatus: WeatherStatuses.emptyValue, temperature: "none")
  }
}

