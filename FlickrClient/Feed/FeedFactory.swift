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
    let vc = FeedViewController()
    
    let presenter = FeedPresenter()
    let interactor = FeedInteractor(
      presenter: presenter,
      feedService: FeedService()
    )
    
    vc.interactor = interactor
    vc.setTableSource(presenter)
    presenter.view = vc
    return vc
  }
}
