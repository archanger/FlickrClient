//
//  FavesListInteractor.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 20/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import Foundation

protocol FavesListPresenterProtocol {
  func dataLoaded(_ data: [Fave])
  func failedLoading(with error: Error)
}

final class FavesListInteractor {
  init(photoID: String, presenter: FavesListPresenterProtocol) {
    _presenter = presenter
    _photoID = photoID
  }
  
  private let _presenter: FavesListPresenterProtocol
  private let _photoID: String
}

extension FavesListInteractor: FavesListInteractorProtocol {
  func loadData() {
    _presenter.dataLoaded(
      [
        Fave(id: "id", username: "s1", date: 0),
        Fave(id: "id", username: "s2", date: 0),
        Fave(id: "id", username: "s3", date: 0),
        Fave(id: "id", username: "s4", date: 0)
      ]
    )
  }
}
