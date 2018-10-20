//
//  CommentCell.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 20/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit

final class CommentCell: UITableViewCell {
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .default, reuseIdentifier: reuseIdentifier)
    
    addSubview(avatarView)
    addSubview(dateLabel)
    addSubview(contentLabel)
    
    avatarView.snp.makeConstraints { (make) in
      make.top.leading.equalToSuperview().inset(8)
      make.height.width.equalTo(44)
      make.bottom.lessThanOrEqualToSuperview().inset(8)
    }
    
    contentLabel.snp.makeConstraints { (make) in
      make.top.equalTo(avatarView)
      make.leading.equalTo(avatarView.snp.trailing).offset(8)
      make.trailing.lessThanOrEqualToSuperview().inset(8)
    }
    
    dateLabel.snp.makeConstraints { (make) in
      make.leading.equalTo(contentLabel)
      make.top.equalTo(contentLabel.snp.bottom).offset(8)
      make.bottom.lessThanOrEqualToSuperview().inset(8)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func update(model: CommentPresentationModel) {
    contentLabel.attributedText = model.content
    avatarView.kf.setImage(with: model.avatarURL)
    dateLabel.text = model.date
  }
  
  private let avatarView = UIImageView()
  private let dateLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 10, weight: .thin)
    return label
  }()
  private let contentLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    return label
  }()
}
