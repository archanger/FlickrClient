//
//  FeedPresentationModel.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 16/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import Foundation

struct FeedPresentationModel {
  let avatarModel: NamedAvatarView.Model
  let mainPhotoModel: FeedMainPhotoView.Model
  let favoritesCountModel: IconedInfoView.Model
  let viewsCountModel: IconedInfoView.Model
  let commentsCountModel: IconedInfoView.Model
}
