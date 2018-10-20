//
//  CommentsListPresenter.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 20/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit

final class CommentsListPresenter: NSObject {
  weak var view: ListViewProtocol?
  
  private var _models: [Comment] = []
}

extension CommentsListPresenter: TableSource {
  func cellClassesForRegistration() -> [IdentifiableCell.Type] {
    return [CommentCell.self]
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return _models.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return _models[indexPath.row].presentationModel.tableView(tableView, cellForRowAt: indexPath)
  }
}

extension CommentsListPresenter: CommentsListPresenterProtocol {
  func failedLoading(with error: Error) {
    view?.display(error: error)
  }
  
  func dataLoaded(_ data: [Comment]) {
    _models.append(contentsOf: data)
    view?.reloadData()
  }
}

private extension Comment {
  var presentationModel: CommentPresentationModel {
    let contentString = NSMutableAttributedString(
      string: username,
      attributes: [.font: UIFont.systemFont(ofSize: 14, weight: .bold)]
    )
    
    contentString.append(NSAttributedString(
      string: " " + content,
      attributes: [.font: UIFont.systemFont(ofSize: 12, weight: .regular)]))
    
    return CommentPresentationModel(
      avatarURL: avatarURL,
      content: contentString,
      date: DateFormatter.localizedString(
        from: Date(timeIntervalSince1970: creationDate),
        dateStyle: .medium,
        timeStyle: .short
      )
    )
  }
}
