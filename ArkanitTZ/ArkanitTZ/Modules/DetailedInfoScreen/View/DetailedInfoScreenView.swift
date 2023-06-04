//
//  DetailedInfoScreenView.swift
//  ArkanitTZ
//
//  Created by Сергей Абросов on 04.06.2023.
//

import Foundation
import UIKit

final class DetailedInfoScreenView: UIViewController {
  
  // MARK: - Properties
  
  let presenter: DetailedInfoScreenPresenter

  private let cityName: UILabel = {
    var label = UILabel()
    label.text = "London"
    label.textColor = .white
    label.font = UIFont(name: "HelveticaNeue-Thin", size: 50.0)
    label.numberOfLines = 1
    return label
  }()
  
  private let temperatureLabel: UILabel = {
    var label = UILabel()
    label.text = "13.0"
    label.textColor = .white
    label.font = UIFont(name: "HelveticaNeue-Thin", size: 75.0)
    label.numberOfLines = 1
    return label
  }()
  
  private lazy var detailedTableView: UITableView = {
    var tableView = UITableView()
    tableView.layer.cornerRadius = 15
    tableView.backgroundColor = .white
    tableView.rowHeight = 75.0
    tableView.register(DetailedTableViewCell.self, forCellReuseIdentifier: "detailedInfoCell")
    return tableView
  }()
  
  // MARK: - DetailedInfoScreenView
  
  init(presenter: DetailedInfoScreenPresenter) {
    self.presenter = presenter
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    setupUI()
  }
  
  // MARK: - Setup
  
  private func setupUI() {
    self.view.backgroundColor = generateRandomColor()
    self.view.addSubview(cityName)
    self.view.addSubview(temperatureLabel)
    self.view.addSubview(detailedTableView)
    
    setupTableView()
    
    setupConstraints()
  }
  
  private func setupConstraints() {
    cityName.snp.makeConstraints {
      $0.top.equalToSuperview().inset(50.0)
      $0.centerX.equalToSuperview()
    }
    
    temperatureLabel.snp.makeConstraints {
      $0.top.equalTo(cityName.snp.bottom).inset(10.0)
      $0.centerX.equalToSuperview()
    }
    
    detailedTableView.snp.makeConstraints {
      $0.top.equalTo(temperatureLabel.snp.bottom).offset(100.0)
      $0.centerX.equalToSuperview()
      $0.leading.trailing.equalToSuperview().inset(16.0)
      $0.bottom.equalToSuperview()
    }
  }
}

// MARK: - DetailedInfoScreenViewExtension

private extension DetailedInfoScreenView {
  func generateRandomColor() -> UIColor {
    UIColor(
      red: Double.random(in: 0.0...1.0),
      green: Double.random(in: 0.0...1.0),
      blue: Double.random(in: 0.0...1.0),
      alpha: 1.0
    )
  }
  
  func generateRandomColorLowAlpha() -> UIColor {
    UIColor(
      red: Double.random(in: 0.0...1.0),
      green: Double.random(in: 0.0...1.0),
      blue: Double.random(in: 0.0...1.0),
      alpha: 0.5
    )
  }
}

// MARK: - TableViewExtension

extension DetailedInfoScreenView: UITableViewDelegate, UITableViewDataSource {
  func setupTableView() {
    detailedTableView.backgroundColor = self.view.backgroundColor
    detailedTableView.delegate = self
    detailedTableView.dataSource = self
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    (presenter as! DetailedInfoScreenPresenter).listOfCities.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: DetailedTableViewCell = tableView.dequeueReusableCell(
      withIdentifier: "detailedInfoCell",
      for: indexPath
    ) as! DetailedTableViewCell

    cell.backgroundColor = generateRandomColorLowAlpha()
    cell.layer.cornerRadius = 15.0
    cell.clipsToBounds = true
    
    let currentModel = (presenter as! DetailedInfoScreenPresenter).listOfCities[indexPath.section]
    cell.config(
      dataLabel: currentModel.cityName,
      statusWeatherLabel: "\(currentModel.weatherStatus)",
      temperatureLabel: "\(currentModel.temperature)°"
    )
    
    cell.backgroundColor = generateRandomColorLowAlpha()
    cell.layer.cornerRadius = 15.0
    cell.clipsToBounds = true
        
    return cell
  }
}
