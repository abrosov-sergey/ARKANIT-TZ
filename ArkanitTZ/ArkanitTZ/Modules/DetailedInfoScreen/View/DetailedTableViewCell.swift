//
//  DetailedTableViewCell.swift
//  ArkanitTZ
//
//  Created by Сергей Абросов on 04.06.2023.
//

import Foundation
import UIKit
import SnapKit

// MARK: - DetailedTableViewCell

final class DetailedTableViewCell: UITableViewCell {
    
  // MARK: - Properties
  
  var dataLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.font = UIFont(name: "HelveticaNeue-Thin", size: 35.0)
    return label
  }()
  
  var statusWeatherLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.font = UIFont(name: "HelveticaNeue-Thin", size: 13.0)
    return label
  }()
  
  var temperatureLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.font = UIFont(name: "HelveticaNeue-Thin", size: 70.0)
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
    self.addSubview(dataLabel)
    self.addSubview(statusWeatherLabel)
    self.addSubview(temperatureLabel)
    
    configConstraints()
  }
  
  private func configConstraints() {
    dataLabel.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalToSuperview().inset(16.0)
    }
    
    statusWeatherLabel.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
    
    temperatureLabel.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.trailing.equalToSuperview().inset(16.0)
    }
  }
  
  func config(dataLabel: String, statusWeatherLabel: String, temperatureLabel: String) {
    self.dataLabel.text = dataLabel
    self.statusWeatherLabel.text = statusWeatherLabel
    self.temperatureLabel.text = temperatureLabel
  }
}
