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
//    FeedPresentationModel(
//      avatarURL: nil,
//      userName: "User1",
//      imageURL: nil,
//      title: "Title1",
//      favoritesCount: "100",
//      viewsCount: "50",
//      commentsCount: "4"
//    ),
//    FeedPresentationModel(
//      avatarURL: nil,
//      userName: "User2",
//      imageURL: nil,
//      title: "Title2",
//      favoritesCount: "101",
//      viewsCount: "52",
//      commentsCount: "0"
//    ),
//    FeedPresentationModel(
//      avatarURL: nil,
//      userName: "User3",
//      imageURL: nil,
//      title: "Title3",
//      favoritesCount: "150",
//      viewsCount: "5000",
//      commentsCount: "12"
//    )
//  ]
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
    
  }
}
