//
//  DetailedInfoScreenPresenter.swift
//  ArkanitTZ
//
//  Created by Сергей Абросов on 04.06.2023.
//

import Foundation

final class DetailedInfoScreenPresenter {
  
  // MARK: - Properties
  
  var view: DetailedInfoScreenView?
  
  var listOfCities: [CityInfoModel] = [
    CityInfoModel(cityName: "Mo", weatherStatus: .cloudy, temperature: "14"),
    CityInfoModel(cityName: "Tu", weatherStatus: .rainy, temperature: "16"),
    CityInfoModel(cityName: "We", weatherStatus: .snow, temperature: "19"),
    CityInfoModel(cityName: "Th", weatherStatus: .extreme, temperature: "18"),
    CityInfoModel(cityName: "Fr", weatherStatus: .snow, temperature: "15"),
    CityInfoModel(cityName: "Sa", weatherStatus: .cloudy, temperature: "12"),
    CityInfoModel(cityName: "Su", weatherStatus: .sunny, temperature: "10")
  ]
}
