//
//  FeedInteractor.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 16/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import Foundation

protocol FeedPresenterProtocol {
  func dataLoaded()
}

final class FeedInteractor {
  init(presenter: FeedPresenterProtocol) {
    _presenter = presenter
  }
  
  private var _presenter: FeedPresenterProtocol
}

extension FeedInteractor: FeedInteractorProtocol {
  func loadDta() {
    _presenter.dataLoaded()
  }
}
