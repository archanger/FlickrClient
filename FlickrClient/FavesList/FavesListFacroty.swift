//
//  FavesListFacroty.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 20/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit

final class FavesListFactory {
  func create(for photoID: String) -> UIViewController {
    let vc = FavesListViewController()
    let presenter = FavesListPresenter()
    let interactor = FavesListInteractor(
      photoID: photoID,
      presenter: presenter,
      service: FaveService(networkProvider: NetworkProvider())
    )
    
    vc.interactor = interactor
    presenter.view = vc
    vc.setTableSource(presenter)
    return vc
  }
}
