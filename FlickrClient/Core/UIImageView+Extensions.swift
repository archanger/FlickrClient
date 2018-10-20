//
//  UIImageView+Extensions.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 20/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit

final class RoundedImageView: UIImageView {
  init() {
    super.init(frame: .zero)
    
    layer.mask = maskLayer
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    let maskPath = UIBezierPath(roundedRect: bounds, cornerRadius: bounds.width/2)
    maskLayer.frame = bounds
    maskLayer.path = maskPath.cgPath
  }
  
  private let maskLayer = CAShapeLayer()
}
