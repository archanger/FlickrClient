//
//  FeedPresenter.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 16/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit

protocol FeedViewProtocol: class {
  func reloadData()
}

final class FeedPresenter: NSObject {
  weak var view: FeedViewProtocol?
  
  private var models = [FeedPresentationModel]()
}

extension FeedPresenter: TableSource {
  func cellClassesForRegistration() -> [IdentifiableCell.Type] {
    return [FeedCell.self]
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return models.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return models[indexPath.row].tableView(tableView, cellForRowAt: indexPath)
  }
}

extension FeedPresenter: FeedPresenterProtocol {
  func dataLoaded(_ data: [FeedsPhoto]) {
    models.append(contentsOf: data.map {
      FeedPresentationModel(
        avatarModel: .init(imageURL: $0.avatarURL, name: $0.userName),
        mainPhotoModel: .init(imageURL: $0.imageURL, title: $0.title),
        favoritesCountModel: .init(icon: #imageLiteral(resourceName: "thumb_up"), text: $0.favoritesCount),
        viewsCountModel: .init(icon: #imageLiteral(resourceName: "eye"), text: $0.viewsCount),
        commentsCountModel: .init(icon: #imageLiteral(resourceName: "comment"), text: $0.commentsCount)
      )
    })
    view?.reloadData()
  }
  
  func failedLoading(with error: Error) {
    print(error)
  }
}
