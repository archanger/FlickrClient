//
//  IconedInfoView.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 17/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit

extension IconedInfoView {
  struct Model {
    let icon: UIImage
    let text: String
    let action: Action?
    
    init(icon: UIImage, text: String, action: Action? = nil) {
      self.icon = icon
      self.text = text
      self.action = action
    }
  }
}

final class IconedInfoView: UIView {
  func update(model: Model) {
    iconView.image = model.icon
    textLabel.text = model.text
    _action = model.action
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(performAction)))
    
    addSubview(iconView)
    addSubview(textLabel)
    
    iconView.snp.makeConstraints { make in
      make.top.leading.bottom.equalToSuperview()
      make.height.equalTo(24)
    }
    
    textLabel.snp.makeConstraints { make in
      make.leading.equalTo(iconView.snp.trailing).offset(8)
      make.centerY.equalTo(iconView)
      make.trailing.equalToSuperview()
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc private func performAction() {
    _action?()
  }
  
  private let iconView = UIImageView()
  private let textLabel = UILabel()
  private var _action: Action?
}
