//
//  FeedView.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 16/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit
import SnapKit

class FeedView: UIView {
  private let tableView = UITableView()
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    
    backgroundColor = .white
    
    addSubview(tableView)
    tableView.snp.makeConstraints { make in
      make.edges.equalTo(safeAreaLayoutGuide)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
