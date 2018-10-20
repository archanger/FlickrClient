//
//  CommentPresentationModel+Extensions.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 20/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit

extension CommentPresentationModel: CellPresentableModel {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: CommentCell = tableView.dequeueCell(for: indexPath)
    cell.update(model: self)
    return cell
  }
}
