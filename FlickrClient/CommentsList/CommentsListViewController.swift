//
//  CommentsListViewController.swift
//  
//
//  Created by Кирилл Чуянов on 19/10/2018.
//

import UIKit

protocol CommentsListInteractorProtocol {
  func loadData()
}

class CommentsListViewController: ListViewController {
  var interactor: CommentsListInteractorProtocol!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Comments"
    
    interactor.loadData()
  }
}

extension CommentsListViewController: CommentsListViewProtocol {
  func reloadData() {
    customView.reloadData()
  }
  
  func display(error: Error) {
    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
    present(alert, animated: true, completion: nil)
  }
}
