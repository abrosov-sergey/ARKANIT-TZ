//
//  SearchCityScreenInteractor.swift
//  ArkanitTZ
//
//  Created by Сергей Абросов on 29.05.2023.
//

import Foundation

// MARK: - SearchCityScreenInteractor
 
final class SearchCityScreenInteractor {
  
  // MARK: - Properties
  
  private let presenter: SearchCityScreenPresenter
  
  private var arrayOfCitiesInfo = [CityInfo]()
  
  // MARK: - Setup
  
  init(presenter: SearchCityScreenPresenter) {
    self.presenter = presenter
  }
}
