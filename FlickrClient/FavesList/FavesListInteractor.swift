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

protocol FavesServiceProtocol {
  func receiveList(for photoID: String, onComlete: @escaping ([Fave]) -> Void, onFailure: @escaping (Error) -> Void)
}

final class FavesListInteractor {
  init(
    photoID: String,
    presenter: FavesListPresenterProtocol,
    service: FavesServiceProtocol
  ) {
    _service = service
    _presenter = presenter
    _photoID = photoID
  }
  
  private let _service: FavesServiceProtocol
  private let _presenter: FavesListPresenterProtocol
  private let _photoID: String
}

extension FavesListInteractor: FavesListInteractorProtocol {
  func loadData() {
    _service.receiveList(
      for: _photoID,
      onComlete: {[weak self] faves in
        DispatchQueue.main.async {
          self?._presenter.dataLoaded(faves)
        }
      },
      onFailure: {[weak self] error in
        DispatchQueue.main.async {
          self?._presenter.failedLoading(with: error)
        }
      }
    )
  }
}
