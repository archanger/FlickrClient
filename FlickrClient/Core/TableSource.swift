//
//  TableSource.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 20/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit

protocol TableSource: UITableViewDataSource & UITableViewDelegate {
  func cellClassesForRegistration() -> [IdentifiableCell.Type]
}
