//
//  WeatherService.swift
//  ArkanitTZ
//
//  Created by Сергей Абросов on 01.06.2023.
//
                
import Foundation

protocol WeatherServiceInput {
  func fetchWeatherByCityName(
    cityName: String,
    success: @escaping (String, String) -> (),
    failed: @escaping (String) -> ()
  )
}

final class WeatherService {
  
  // MARK: - Properties
  
  private let geocodingService: GeocodingService
  private let fromKtoC = 273.15
  private let userKey = UserInfoModel().userKey
  
  // MARK: - WeatherService
  
  init(geocodingService: GeocodingService) {
    self.geocodingService = geocodingService
  }
}

// MARK: - WeatherServiceInput

extension WeatherService: WeatherServiceInput {
  func fetchWeatherByCityName(
    cityName: String,
    success: @escaping (String, String) -> (),
    failed: @escaping (String) -> ()
  ) {
    
    geocodingService.fetchLatLonByName(cityName: cityName) { lat, lon in
      guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(self.userKey)") else { return }
      
      let task = URLSession.shared.dataTask(
        with: url
      ) { (data, response, error) in
        if let error = error {
          failed("\(error)")
          return
        }
        
        do {
          if let data = data {
            let model = try JSONDecoder().decode(WeatherModel.self, from: data)
            success("\(Int(trunc(round(model.main.temp - self.fromKtoC))))", model.weather[0].main)
          } else {
            failed("Data не пришла")
          }
        } catch {
          failed("Какая-то ошибка")
        }
      }
      
      task.resume()
    } failed: { error in
      failed(error)
    }
  }
}
