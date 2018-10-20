//
//  FeedRouter.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 19/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit

final class FeedRouter {
  init(rootViewController: UIViewController) {
    _rootViewController = rootViewController
  }
  
  private weak var _rootViewController: UIViewController?
}

extension FeedRouter: FeedRouterProtocol {
  func openCommentsList(for photoID: String) {
    let comments = CommentsListFactory().create(for: photoID)
    _rootViewController?.navigationController?.pushViewController(comments, animated: true)
  }
  
  func openFavesList(for photoID: String) {
    let faves = FavesListFactory().create(for: photoID)
    _rootViewController?.navigationController?.pushViewController(faves, animated: true)
  }
}
