//
//  FeedMainPhotoView.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 17/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

extension FeedMainPhotoView {
  struct Model {
    let imageURL: URL?
    let title: String
  }
}

final class FeedMainPhotoView: UIView {
  func update(model: Model) {
    imageView.kf.setImage(with: model.imageURL)
    titleLabel.text = model.title
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    titleLabel.numberOfLines = 0
    
    addSubview(imageView)
    addSubview(contentView)
    contentView.addSubview(titleLabel)
    
    titleLabel.textColor = .white
    
    imageView.snp.makeConstraints { make in
      make.top.leading.bottom.trailing.equalToSuperview()
    }
    
    contentView.snp.makeConstraints { make in
      make.leading.bottom.trailing.equalToSuperview()
      make.top.greaterThanOrEqualToSuperview()
    }
    
    titleLabel.snp.makeConstraints { make in
      make.top.leading.bottom.equalToSuperview().inset(8)
      make.trailing.lessThanOrEqualToSuperview().inset(8)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private let imageView = UIImageView()
  private let contentView = GradientView()
  private let titleLabel = UILabel()
}
