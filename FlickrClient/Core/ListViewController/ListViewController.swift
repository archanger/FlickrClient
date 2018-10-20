//
//  ListViewController.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 20/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit

protocol ListInteractorProtocol {
  func loadData()
}

protocol ListViewProtocol: class {
  func reloadData()
  func display(error: Error)
}

class ListViewController: CustomViewController<ListView> {
  var interactor: ListInteractorProtocol!
  
  func setTableSource(_ tableSource: TableSource) {
    customView.source = tableSource
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    interactor.loadData()
  }
}

extension ListViewController: ListViewProtocol {
  func reloadData() {
    customView.reloadData()
  }
  
  func display(error: Error) {
    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
    present(alert, animated: true, completion: nil)
  }
}
