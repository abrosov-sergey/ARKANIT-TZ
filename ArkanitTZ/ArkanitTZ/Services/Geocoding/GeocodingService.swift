//
//  GeocodingService.swift
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

protocol GeocodingServiceInput {
  func fetchLatLonByName(
    cityName: String,
    success: @escaping (String, String) -> (),
    failed: @escaping (String) -> ()
  )
}

// MARK: - GeocodingService

final class GeocodingService {
  private let userKey = UserInfoModel().userKey
}

// MARK: - GeocodingServiceInput

extension GeocodingService: GeocodingServiceInput {
  func fetchLatLonByName(
    cityName: String,
    success: @escaping (String, String) -> (),
    failed: @escaping (String) -> ()
  ) {
      
    guard let url = URL(string: "https://api.openweathermap.org/geo/1.0/direct?q=\(cityName)&limit=5&appid=\(self.userKey)") else { return }
    
    let task = URLSession.shared.dataTask(
      with: url
    ) { (data, response, error) in
      if let error = error {
        print("\(error)")
        failed("\(error)")
        return
      }
      
      do {
        if let data = data {
          let json = try JSONSerialization.jsonObject(with: data, options: [.allowFragments])
          
          guard let jsonDict = json as? [[String: Any]] else {
            print("Не удалось перевести data в json")
            failed("Не удалось перевести data в json")
            return
          }
          
          guard
            let lat = jsonDict[0]["lat"] as? Double,
            let lon = jsonDict[0]["lon"] as? Double
          else {
            print("Не удалось получить lat/lon")
            failed("Не удалось получить lat/lon")
            return
          }
          
          print(lat, lon)
          success("\(lat)", "\(lon)")
        } else {
          print("Data не пришла")
          failed("Data не пришла")
        }
      } catch {
        print("Какая-то ошибка")
        failed("Какая-то ошибка")
      }
    }
    
    task.resume()
  }
}
