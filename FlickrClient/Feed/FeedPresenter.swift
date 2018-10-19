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
  func display(error: Error)
}

protocol FeedRouterProtocol {
  func openCommentsList(for photoId: String)
}

final class FeedPresenter: NSObject {
  weak var view: FeedViewProtocol?
  
  init(router: FeedRouterProtocol) {
    _router = router
    super.init()
  }
  
  private func prepareEntityToPresentation(_ entity: FeedsPhoto) -> FeedPresentationModel {
    return FeedPresentationModel(
      avatarModel: .init(imageURL: entity.avatarURL, name: entity.userName),
      mainPhotoModel: .init(imageURL: entity.imageURL, title: entity.title),
      favoritesCountModel: .init(icon: #imageLiteral(resourceName: "thumb_up"), text: entity.favoritesCount, action: { print("favs") }),
      viewsCountModel: .init(icon: #imageLiteral(resourceName: "eye"), text: entity.viewsCount),
      commentsCountModel: .init(icon: #imageLiteral(resourceName: "comment"), text: entity.commentsCount, action: { [weak self] in self?._router.openCommentsList(for: entity.id) })
    )
  }
  
  private var models = [FeedsPhoto]()
  private let _router: FeedRouterProtocol
}

extension FeedPresenter: TableSource {
  func cellClassesForRegistration() -> [IdentifiableCell.Type] {
    return [FeedCell.self]
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return models.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let presentationModel = prepareEntityToPresentation(models[indexPath.row])
    return presentationModel.tableView(tableView, cellForRowAt: indexPath)
  }
}

extension FeedPresenter: FeedPresenterProtocol {
  func dataLoaded(_ data: [FeedsPhoto]) {
    models.append(contentsOf: data)
    view?.reloadData()
  }
  
  func failedLoading(with error: Error) {
    view?.display(error: error)
  }
}
