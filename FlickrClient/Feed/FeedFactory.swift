//
//  FeedFactory.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 16/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit

final class FeedFactory {
  func create() -> UIViewController {
    let vc = ListViewController()
    vc.title = "Photos"
    let router = FeedRouter(rootViewController: vc)
    let presenter = FeedPresenter(router: router)
    let interactor = FeedInteractor(
      presenter: presenter,
      feedService: FeedService(networkProvider: NetworkProvider())
    )
    
    vc.interactor = interactor
    presenter.view = vc
    vc.setTableSource(presenter)
    return vc
  }
}
