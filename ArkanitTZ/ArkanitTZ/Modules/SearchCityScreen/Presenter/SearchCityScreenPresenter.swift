//
//  SearchCityScreenPresenter.swift
//  ArkanitTZ
//
//  Created by Сергей Абросов on 29.05.2023.
//

import Foundation

protocol SearchCityScreenPresenterViewInput {
  func fetchWeather(cityName: String)
  func removeCityByIndex(index: Int)
  func showDetailedScreen(index: Int)
}

protocol SearchCityScreenPresenterInteractorInput {
  func tableViewReloadData()
  func addNewCity(model: CityInfoModel)
}

// MARK: - SearchCityScreenPresenter
 
final class SearchCityScreenPresenter {
  
  // MARK: - Properties
  
  var view: SearchCityScreenViewPresenterInput?
  var router: SearchCityScreenRouterPresenterInput?
  var interactor: SearchCityScreenInteractorPresenterInput?
  
  var listOfCities = [CityInfoModel]() {
    didSet {
      view?.tableViewReloadData()
    }
  }
}

// MARK: - SearchCityScreenPresenterViewInput

extension SearchCityScreenPresenter: SearchCityScreenPresenterViewInput {
  func fetchWeather(cityName: String) {
    interactor?.fetchWeather(cityName: cityName)
  }
  
  func removeCityByIndex(index: Int) {
    listOfCities.remove(at: index)
  }
  
  func showDetailedScreen(index: Int) {
    self.router?.showDetailedScreen(cityInfo: listOfCities[index])
  }
}

// MARK: - SearchCityScreenPresenterInteractorInput

extension SearchCityScreenPresenter: SearchCityScreenPresenterInteractorInput {
  func tableViewReloadData() {
    view?.tableViewReloadData()
  }
  
  func addNewCity(model: CityInfoModel) {
    listOfCities.append(model)
  }
}
