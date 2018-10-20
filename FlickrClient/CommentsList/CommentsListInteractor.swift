//
//  CommentsListInteractor.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 20/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import Foundation

protocol CommentsListPresenterProtocol {
  func dataLoaded(_ data: [Comment])
  func failedLoading(with error: Error)
}

protocol CommetnsServiceProtocol {
  func receiveList(for photoID: String, onComlete: @escaping ([Comment]) -> Void, onFailure: @escaping (Error) -> Void)
}

final class CommentsListInteractor {
  init(
    photoID: String,
    presenter: CommentsListPresenterProtocol,
    service: CommetnsServiceProtocol
  ) {
    _presenter = presenter
    _service = service
    _photoID = photoID
  }
  
  private let _presenter: CommentsListPresenterProtocol
  private let _service: CommetnsServiceProtocol
  private let _photoID: String
}

extension CommentsListInteractor: ListInteractorProtocol {
  func loadData() {
    _service.receiveList(
      for: _photoID, 
      onComlete: { comments in
        DispatchQueue.main.async {
          self._presenter.dataLoaded(comments)
        }
      },
      onFailure: { error in
        DispatchQueue.main.async {
          self._presenter.failedLoading(with: error)
        }
      }
    )
  }
}
