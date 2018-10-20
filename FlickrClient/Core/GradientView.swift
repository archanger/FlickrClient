//
//  GradientView.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 20/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit

final class GradientView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    if let gLayer = layer as? CAGradientLayer {
      gLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
      gLayer.locations = [0.0, 0.6]
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override class var layerClass: AnyClass {
    return CAGradientLayer.self
  }
}
