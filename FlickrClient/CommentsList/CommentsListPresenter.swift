//
//  CommentsListPresenter.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 20/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit

protocol CommentsListViewProtocol: class {
  func reloadData()
  func display(error: Error)
}

final class CommentsListPresenter: NSObject {
  weak var view: CommentsListViewProtocol?
  
  private var _models: [CommentPresentationModel] = [
    CommentPresentationModel(title: "Helloo1"),
    CommentPresentationModel(title: "Hello2"),
    CommentPresentationModel(title: "Helloo34")
  ]
}

extension CommentsListPresenter: TableSource {
  func cellClassesForRegistration() -> [IdentifiableCell.Type] {
    return [CommentCell.self]
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return _models.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return _models[indexPath.row].tableView(tableView, cellForRowAt: indexPath)
  }
}
