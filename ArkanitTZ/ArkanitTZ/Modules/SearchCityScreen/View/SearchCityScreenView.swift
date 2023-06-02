//
//  SearchCityScreenView.swift
//  ArkanitTZ
//
//  Created by Сергей Абросов on 29.05.2023.
//

import Foundation
import UIKit

// MARK: - SearchCityScreenView

final class SearchCityScreenView: UIViewController {
  
  // MARK: - Properties
  
  private let presenter: SearchCityScreenPresenterViewInput
  
  private let citySearchTextField: UISearchTextField = {
    let searchTextField = UISearchTextField()
    searchTextField.attributedPlaceholder = NSAttributedString(
      string: "City name",
      attributes: [NSAttributedString.Key.foregroundColor: UIColor(white: 0.5, alpha: 0.5)]
    )
    searchTextField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 0.0))
    searchTextField.backgroundColor = .black
    searchTextField.tokenBackgroundColor = .lightGray
    searchTextField.textColor = .lightGray
    searchTextField.layer.cornerRadius = 15.0
    searchTextField.returnKeyType = .search
    searchTextField.addTarget(SearchCityScreenView.self, action: #selector(searchTextFieldTapped), for: .editingDidEnd)
    return searchTextField
  }()
  
  private let citiesTableView: UITableView = {
    let tableView = UITableView()
    tableView.layer.cornerRadius = 15.0
    tableView.backgroundColor = .white
    tableView.rowHeight = 180.0
    tableView.register(SearchCityTableViewCell.self, forCellReuseIdentifier: "cityCell")
    return tableView
  }()
  
  // MARK: - ViewController
  
  init(presenter: SearchCityScreenPresenter) {
    self.presenter = presenter
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  // MARK: - Actions
  
  @objc func rightBarItemPressed() {
    print("Pressed")
  }
  
  @objc func searchTextFieldTapped() {
    
    presenter.fetchWeather(cityName: <#T##String#>)
  }
  
  // MARK: - Setup
  
  private func setupUI() {
    view.backgroundColor = .black
    view.addSubview(citySearchTextField)
    view.addSubview(citiesTableView)
    
    setupTableView()
    setupNavigationBar()
    
    setupConstraints()
  }
  
  private func setupNavigationBar() {
    guard let navigationController else { return }
    self.title = "Weather"
    
    self.navigationController?.navigationBar.largeTitleTextAttributes = [
      NSAttributedString.Key.foregroundColor: UIColor(white: 1.0, alpha: 1.0),
      NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 35.0)
    ]
    
    navigationController.navigationBar.prefersLargeTitles = true
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(rightBarItemPressed))
  }
  
  private func setupConstraints() {
    citySearchTextField.snp.makeConstraints {
      $0.top.equalTo(self.view.safeAreaLayoutGuide)
      $0.left.right.equalTo(self.view.safeAreaLayoutGuide).inset(16.0)
      $0.height.equalTo(40.0)
    }

    citiesTableView.snp.makeConstraints {
      $0.top.equalTo(citySearchTextField.snp.bottom).offset(8.0)
      $0.left.right.equalTo(self.view.safeAreaLayoutGuide).inset(15.0)
      $0.bottom.equalToSuperview()
    }
  }
}

// MARK: - PrivateExtension

private extension SearchCityScreenView {
  
}

// MARK: - UITableView

extension SearchCityScreenView: UITableViewDelegate, UITableViewDataSource {
  func setupTableView() {
    citiesTableView.backgroundColor = .black
    citiesTableView.delegate = self
    citiesTableView.dataSource = self
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
//    presenter.fetchCitiesCount()
    5
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    1
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    5.0
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let header = UIView()
    header.backgroundColor = .clear
    return header
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: SearchCityTableViewCell = tableView.dequeueReusableCell(
      withIdentifier: "cityCell",
      for: indexPath
    ) as! SearchCityTableViewCell
    
    cell.backgroundColor = .white
    cell.layer.borderColor = UIColor.black.cgColor
    cell.layer.borderWidth = 1.0
    cell.layer.cornerRadius = 15.0
    cell.clipsToBounds = true
    cell.config(image: WeatherStatuses.cloudy.weather, cityName: "Moscow", temperature: "10°", statusWeather: "Cloudy")
  
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("You tapped cell number \(indexPath.section).")
  }
}
