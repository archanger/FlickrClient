//
//  CustomViewController.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 16/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit

class CustomViewController<View>: UIViewController where View: UIView{

  var customView: View {
      loadViewIfNeeded()
      return _view
  }
  
  override func loadView() {
    _view = View(frame: .zero)
    view = _view
  }
  
  private var _view: View!
}
