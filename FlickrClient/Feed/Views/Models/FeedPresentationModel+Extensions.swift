//
//  FeedPresentationModel+Extensions.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 16/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit

extension FeedPresentationModel: CellPresentableModel {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: FeedCell = tableView.dequeueCell(for: indexPath)
    cell.update(model: self)
    return cell;
  }
}
