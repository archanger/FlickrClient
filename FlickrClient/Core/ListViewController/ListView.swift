//
//  ListView.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 20/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit

class ListView: UIView {
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
    _tableView.tableFooterView = UIView()
    
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
