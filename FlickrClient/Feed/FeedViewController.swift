//
//  FeedViewController.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 16/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit

protocol FeedInteractorProtocol {
  func loadDta()
}

class FeedViewController: CustomViewController<FeedView> {
  
  var interactor: FeedInteractorProtocol!
  
  func setTableSource(_ tableSource: TableSource) {
    customView.source = tableSource
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .orange
    title = "Photos"
    
    interactor.loadDta()
  }
}

extension FeedViewController: FeedViewProtocol {
  func reloadData() {
    customView.reloadData()
  }
  
  func display(error: Error) {
    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
    present(alert, animated: true, completion: nil)
  }
}
