//
//  FavesListViewController.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 20/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit

protocol FavesListInteractorProtocol {
  func loadData()
}

final class FavesListViewController: ListViewController {
  var interactor: FavesListInteractorProtocol!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Marked as \"Favorite\""
    
    interactor.loadData()
  }
}

extension FavesListViewController: CommentsListViewProtocol {
  func reloadData() {
    customView.reloadData()
  }
  
  func display(error: Error) {
    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
    present(alert, animated: true, completion: nil)
  }
}
