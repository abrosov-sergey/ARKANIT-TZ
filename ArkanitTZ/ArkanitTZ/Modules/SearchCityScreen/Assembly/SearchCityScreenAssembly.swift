//
//  SearchCityScreenAssembly.swift
//  ArkanitTZ
//
//  Created by Сергей Абросов on 29.05.2023.
//

import Foundation
import Swinject

typealias SearchCityScreenModule = SearchCityScreenView

final class SearchCityScreenAssembly: Swinject.Assembly {
  func assemble(container: Container) {
    container.register(
      SearchCityScreenModule.self
    ) { resolver in
      let weatherService = resolver.resolve(WeatherService.self)!
      
      let presenter = SearchCityScreenPresenter()
      let view = SearchCityScreenView(presenter: presenter)
      let interactor = SearchCityScreenInteractor(weatherService: weatherService, presenter: presenter)
      let router = SearchCityScreenRouter(view: view)
      
      presenter.view = view
      presenter.interactor = interactor
      presenter.router = router
      
      return view
    }
  }
}
