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
    
    backgroundColor = .clear
    
    layer.addSublayer(gradientLayer)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    gradientLayer.frame = bounds
  }
  
  private let gradientLayer: CAGradientLayer = {
    let layer = CAGradientLayer()
    layer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
    layer.locations = [0.0, 0.6]
    return layer
  }()
}
