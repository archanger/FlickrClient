//
//  Comment.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 20/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import Foundation

struct Comment {
  let id: String
  let creationDate: TimeInterval
  let username: String
  let avatarURL: URL?
  let content: String
}
