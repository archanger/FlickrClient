//
//  UITableView+Extensions.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 16/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit

protocol IdentifiableCell: class {
  static var identifier: String { get }
}

extension UITableViewCell: IdentifiableCell {
  static var identifier: String {
    return String(describing: self)
  }
}

extension UITableView {
  
  func dequeueCell<Cell: UITableViewCell>(for indexPath: IndexPath) -> Cell {
    return dequeueReusableCell(withIdentifier: Cell.identifier, for: indexPath) as! Cell
  }
  
  func register(_ cellClass: IdentifiableCell.Type) {
    register(cellClass, forCellReuseIdentifier: cellClass.identifier)
  }
  
  func register(_ cellClasses: [IdentifiableCell.Type]) {
    cellClasses.forEach { self.register($0) }
  }
}
