//
//  CommentCell.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 20/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit

final class CommentCell: UITableViewCell {
  func update(model: CommentPresentationModel) {
    textLabel?.text = model.title
  }
}
