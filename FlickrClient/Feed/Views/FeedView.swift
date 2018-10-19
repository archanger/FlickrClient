//
//  FeedView.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 16/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit
import SnapKit

protocol TableSource: UITableViewDataSource & UITableViewDelegate {
  func cellClassesForRegistration() -> [IdentifiableCell.Type]
}

class FeedView: UIView {
  
  weak var source: TableSource? {
    didSet {
      _tableView.dataSource = source
      _tableView.delegate = source
      _tableView.register(source!.cellClassesForRegistration())
    }
  }
  
  func reloadData() {
    _tableView.reloadData()
  }
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    
    backgroundColor = .white
    
    _tableView.allowsSelection = false
    
    addSubview(_tableView)
    _tableView.snp.makeConstraints { make in
      make.edges.equalTo(safeAreaLayoutGuide)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private let _tableView = UITableView()
}
