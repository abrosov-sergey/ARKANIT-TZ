//
//  SearchCityScreenRouter.swift
//  ArkanitTZ
//
//  Created by Сергей Абросов on 29.05.2023.
//

import Foundation

protocol SearchCityScreenRouterPresenterInput {
  func showDetailedScreen(cityInfo: CityInfoModel)
}

// MARK: - SearchCityScreenRouter
 
final class SearchCityScreenRouter {
  
  // MARK: - Properties
  
  let view: SearchCityScreenView
  
  // MARK: - SearchCityScreenRouter
  
  init(view: SearchCityScreenView) {
    self.view = view
  }
}

// MARK: - SearchCityScreenRouterPresenterInput

extension SearchCityScreenRouter: SearchCityScreenRouterPresenterInput {
  func showDetailedScreen(cityInfo: CityInfoModel) {
    let detailedInfoScreenModule = Assembly.resolver.resolve(DetailedInfoScreenModule.self)!
    self.view.present(detailedInfoScreenModule, animated: true)
  }
}
