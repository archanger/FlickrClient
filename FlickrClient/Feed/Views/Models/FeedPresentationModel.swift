//
//  FeedPresentationModel.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 16/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import Foundation

struct FeedPresentationModel {
  let avatarURL: URL?
  let userName: String
  let imageURL: URL?
  let title: String
  let favoritesCount: String
  let viewsCount: String
  let commentsCount: String
}
