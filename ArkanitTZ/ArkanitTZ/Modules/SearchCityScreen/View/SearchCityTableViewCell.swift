//
//  TableViewCell.swift
//  ArkanitTZ
//
//  Created by Сергей Абросов on 29.05.2023.
//

import Foundation
import UIKit
import SnapKit

// MARK: - SearchCityTableViewCell

final class SearchCityTableViewCell: UITableViewCell {
    
  // MARK: - Properties
  
  var backgroundImageView: UIImageView = {
    let imageView = UIImageView()
    return imageView
  }()
  
  var cityNameLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.font = UIFont(name: "HelveticaNeue-Bold", size: 35.0)
    return label
  }()
  
  var temperatureLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.font = UIFont(name: "HelveticaNeue-Bold", size: 70.0)
    return label
  }()
  
  var statusWeatherLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.font = UIFont(name: "HelveticaNeue-Bold", size: 13.0)
    return label
  }()
  
  // MARK: - UITableViewCell
    
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Setup
    
  private func configUI() {
    self.backgroundColor = .black
    self.addSubview(backgroundImageView)
    self.addSubview(cityNameLabel)
    self.addSubview(temperatureLabel)
    self.addSubview(statusWeatherLabel)
    
    configConstraints()
  }
  
  private func configConstraints() {
    backgroundImageView.snp.makeConstraints {
      $0.center.equalToSuperview()
      $0.edges.equalToSuperview()
    }
    
    cityNameLabel.snp.makeConstraints {
      $0.top.equalToSuperview().inset(5.0)
      $0.leading.equalToSuperview().inset(15.0)
    }
    
    temperatureLabel.snp.makeConstraints {
      $0.top.equalToSuperview().inset(0.0)
      $0.trailing.equalToSuperview().inset(15.0)
    }
    
    statusWeatherLabel.snp.makeConstraints {
      $0.bottom.equalToSuperview().inset(5.0)
      $0.leading.equalToSuperview().inset(15.0)
    }
  }
  
  func config(image: UIImage, cityName: String, temperature: String, statusWeather: String) {
    backgroundImageView.image = image
    cityNameLabel.text = cityName
    temperatureLabel.text = temperature
    statusWeatherLabel.text = statusWeather
  }
}
