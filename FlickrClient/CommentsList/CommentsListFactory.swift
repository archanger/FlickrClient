//
//  CommentsListFactory.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 19/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit

final class CommentsListFactory {
  func create(for photoId: String) -> UIViewController {
    print(photoId)
    let vc = CommentsListViewController()
    let presenter = CommentsListPresenter()
    let interactor = CommentsListInteractor(
      photoID: photoId,
      presenter: presenter,
      service: CommentsService(networkProvider: NetworkProvider())
    )
    vc.interactor = interactor
    vc.setTableSource(presenter)
    presenter.view = vc
    return vc
  }
}
