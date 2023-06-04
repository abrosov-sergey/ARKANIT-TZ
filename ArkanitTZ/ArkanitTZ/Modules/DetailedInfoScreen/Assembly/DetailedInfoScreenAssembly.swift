//
//  DetailedInfoScreenAssembly.swift
//  ArkanitTZ
//
//  Created by Сергей Абросов on 04.06.2023.
//

import Foundation
import Swinject

typealias DetailedInfoScreenModule = DetailedInfoScreenView

final class DetailedInfoScreenAssembly: Swinject.Assembly {
  func assemble(container: Swinject.Container) {
    container.register(DetailedInfoScreenModule.self) { resolver in
      let presenter = DetailedInfoScreenPresenter()
      let view = DetailedInfoScreenView(presenter: presenter)
      
      presenter.view = view
      
      return view
    }
  }
}
