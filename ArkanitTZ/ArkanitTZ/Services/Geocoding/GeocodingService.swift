//
//  GeocodingService.swift
//  ArkanitTZ
//
//  Created by Сергей Абросов on 01.06.2023.
//

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
