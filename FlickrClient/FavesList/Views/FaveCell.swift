//
//  FaveCell.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 20/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit

final class FaveCell: UITableViewCell {
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .default, reuseIdentifier: reuseIdentifier)
    
    addSubview(avatarView)
    addSubview(nameLabel)
    addSubview(dateLabel)
    
    avatarView.snp.makeConstraints { (make) in
      make.top.leading.equalToSuperview().inset(GLOBAL_APPEARANCE.insets)
      make.height.width.equalTo(44)
      make.bottom.lessThanOrEqualToSuperview().inset(GLOBAL_APPEARANCE.insets)
    }
    
    nameLabel.snp.makeConstraints { (make) in
      make.top.equalTo(avatarView)
      make.leading.equalTo(avatarView.snp.trailing).offset(8)
      make.trailing.lessThanOrEqualToSuperview().inset(GLOBAL_APPEARANCE.insets)
    }
    
    dateLabel.snp.makeConstraints { (make) in
      make.leading.equalTo(nameLabel)
      make.top.equalTo(nameLabel.snp.bottom).offset(8)
      make.bottom.lessThanOrEqualToSuperview().inset(GLOBAL_APPEARANCE.insets)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func update(model: FavePresentationModel) {
    avatarView.kf.setImage(with: model.avatarURL)
    nameLabel.text = model.username
    dateLabel.text = model.date
  }
  
  private let avatarView = RoundedImageView()
  private let nameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    return label
  }()
  private let dateLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 10, weight: .thin)
    return label
  }()
}
