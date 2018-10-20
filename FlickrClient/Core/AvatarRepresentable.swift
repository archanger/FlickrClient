//
//  AvatarRepresentable.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 20/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import Foundation

protocol AvatarRepresentable {
  var iconfarm: Int { get }
  var iconserver: String { get }
  var nsid: String { get }
}

extension AvatarRepresentable {
  func avatarURL() -> URL? {
    return (Int(iconserver) ?? 0) > 0
      ? URL(string: "https://farm\(iconfarm).staticflickr.com/\(iconserver)/buddyicons/\(nsid).jpg")
      : URL(string: "https://www.flickr.com/images/buddyicon.gif")
  }
}
