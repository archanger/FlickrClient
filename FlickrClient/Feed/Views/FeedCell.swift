//
//  FeedCell.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 16/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit
import SnapKit

class FeedCell: UITableViewCell {
  func update(model: FeedPresentationModel) {
    avatarView.update(model: .init(
      imageURL: model.avatarURL,
      name: model.userName
    ))
    mainPhotoView.update(model: .init(
      imageURL: model.imageURL,
      title: model.title
    ))
    
    infoView.update(model: FeedInfoView.Model(
      favoritesModel: IconedInfoView.Model(
        icon: #imageLiteral(resourceName: "thumb_up"),
        text: model.favoritesCount
      ),
      viewsModel: IconedInfoView.Model(
        icon: #imageLiteral(resourceName: "eye"),
        text: model.viewsCount
      ),
      commentsModel: IconedInfoView.Model(
        icon: #imageLiteral(resourceName: "comment"),
        text: model.commentsCount
      )
    ))
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .default, reuseIdentifier: reuseIdentifier)
    
    addSubview(avatarView)
    addSubview(mainPhotoView)
    addSubview(infoView)
    
    avatarView.snp.makeConstraints { make in
      make.top.leading.trailing.equalToSuperview().inset(8)
    }
    
    mainPhotoView.snp.makeConstraints { make in
      make.top.equalTo(avatarView.snp.bottom).offset(8)
      make.leading.trailing.equalToSuperview().inset(8)
      make.height.equalTo(mainPhotoView.snp.width)
    }
    
    infoView.snp.makeConstraints { make in
      make.leading.bottom.trailing.equalToSuperview().inset(8)
      make.top.equalTo(mainPhotoView.snp.bottom).offset(8)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private let avatarView = NamedAvatarView()
  private let mainPhotoView = FeedMainPhotoView()
  private let infoView = FeedInfoView()
}
