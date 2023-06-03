//
//  WeatherService.swift
//  ArkanitTZ
//
//  Created by Сергей Абросов on 01.06.2023.
//

//Dear Customer!
//
//
//Thank you for subscribing to Free OpenWeatherMap!
//
//API key:
//- Your API key is 62fc198619775d03905923185bb03ca4
//- Within the next couple of hours, it will be activated and ready to use
//- You can later create more API keys on your account page
//- Please, always use your API key in each API call
//
//Endpoint:
//- Please, use the endpoint api.openweathermap.org for your API calls
//- Example of API call:
//api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=62fc198619775d03905923185bb03ca4
//
//Useful links:
//- API documentation https://openweathermap.org/api
//- Details of your plan https://openweathermap.org/price
//- Please, note that 16-days daily forecast and History API are not available for Free subscribers
//
//
//Blog
//Support center & FAQ
//Contact us info@openweathermap.org.
//
//Best Regards,
//OpenWeather team
                
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
