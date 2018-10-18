//
//  FeedInteractor.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 16/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import Foundation

protocol FeedPresenterProtocol {
  func dataLoaded(_ data: [FeedsPhoto])
  func failedLoading(with error: Error)
}

protocol FeedServiceProtocol {
  func receiveList(onComlete: @escaping ([FeedsPhoto]) -> Void, onFailure: @escaping (Error) -> Void)
}

final class FeedInteractor {
  init(presenter: FeedPresenterProtocol, feedService: FeedServiceProtocol) {
    _presenter = presenter
    _feedService = feedService
  }
  
  private var _presenter: FeedPresenterProtocol
  private var _feedService: FeedServiceProtocol
}

extension FeedInteractor: FeedInteractorProtocol {
  func loadDta() {
    _feedService.receiveList(
      onComlete: { [weak self] feed in
        DispatchQueue.main.async {
          self?._presenter.dataLoaded(feed)
        }
      },
      onFailure: { [weak self] error in
        DispatchQueue.main.async {
          self?._presenter.failedLoading(with: error)
        }
      }
    )
  }
}
