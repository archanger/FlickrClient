//
//  File.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 20/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import Foundation

protocol UsernameRepresentable {
  var username: String { get }
  var realname: String { get }
}

extension UsernameRepresentable {
  func username() -> String {
    return realname.isEmpty
      ? username
      : realname
  }
}
