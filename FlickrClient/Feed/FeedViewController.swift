//
//  FeedViewController.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 16/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit

class FeedViewController: CustomViewController<FeedView> {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .orange
    title = "Photos"
  }
  
}
