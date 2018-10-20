//
//  ListViewController.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 20/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit

class ListViewController: CustomViewController<ListView> {
  
  func setTableSource(_ tableSource: TableSource) {
    customView.source = tableSource
  }
  
}
