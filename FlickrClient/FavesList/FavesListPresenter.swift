//
//  FavesListPresenter.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 20/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit

final class FavesListPresenter: NSObject {
  weak var view: ListViewProtocol?
  
  private var _models: [Fave] = []
}

extension FavesListPresenter: TableSource {
  func cellClassesForRegistration() -> [IdentifiableCell.Type] {
    return [FaveCell.self]
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return _models.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return _models[indexPath.row].presentationModel.tableView(tableView, cellForRowAt: indexPath)
  }
}

extension FavesListPresenter: FavesListPresenterProtocol {
  func dataLoaded(_ data: [Fave]) {
    _models.append(contentsOf: data)
    view?.reloadData()
  }
  
  func failedLoading(with error: Error) {
    view?.display(error: error)
  }
}

private extension Fave {
  var presentationModel: FavePresentationModel {
    return FavePresentationModel(
      username: username,
      avatarURL: avatarURL,
      date: DateFormatter.localizedString(
        from: Date(timeIntervalSince1970: date),
        dateStyle: .medium,
        timeStyle: .short
      )
    )
  }
}
