//
//  CommentsListInteractor.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 20/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import Foundation

protocol CommentsListPresenterProtocol {
  func dataLoaded()
  func failedLoading(with error: Error)
}

final class CommentsListInteractor {
  init(presenter: CommentsListPresenterProtocol) {
    _presenter = presenter
  }
  
  private let _presenter: CommentsListPresenterProtocol
}

extension CommentsListInteractor: CommentsListInteractorProtocol {
  func loadData() {
    _presenter.dataLoaded()
  }
}
