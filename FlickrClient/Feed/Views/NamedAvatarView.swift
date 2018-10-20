//
//  NamedAvatarView.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 17/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit
import Kingfisher

extension NamedAvatarView {
  struct Model {
    let imageURL: URL?
    let name: String
  }
}

final class NamedAvatarView: UIView {
  func update(model: Model) {
    avatarImageView.kf.setImage(with: model.imageURL)
    nameLabel.text = model.name
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    avatarImageView.contentMode = .scaleAspectFill
    
    addSubview(avatarImageView)
    addSubview(nameLabel)
    
    avatarImageView.snp.makeConstraints { make in
      make.height.width.equalTo(44)
      make.top.leading.bottom.equalToSuperview()
    }
    
    nameLabel.snp.makeConstraints { make in
      make.leading.equalTo(avatarImageView.snp.trailing).offset(8)
      make.centerY.equalTo(avatarImageView)
      make.trailing.lessThanOrEqualToSuperview()
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private let avatarImageView = UIImageView()
  private let nameLabel = UILabel()
}
