//
//  FeedsPhotoCollectionResponse.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 19/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import Foundation

struct FeedsPhotoCollectionResponse {
  let photos: [FeedsPhoto]?
  let stats: ResponseStats
}

extension FeedsPhotoCollectionResponse: Decodable {
  private struct Response: Decodable {
    let photos: Photos?
    let stat: String
    let code: Int?
    let message: String?
    
    struct Photos: Decodable {
      let photo: [ResponsePhoto]
      
      struct ResponsePhoto: Decodable {
        let id: String
        let ownername: String
        let urlZ: String
        let title: String
        let countFaves: String
        let countComments: String
        let views: String
        let iconserver: String
        let iconfarm: Int
        let owner: String
        
        func avatarURL() -> URL? {
          return (Int(iconserver) ?? 0) > 0
            ? URL(string: "https://farm\(iconfarm).staticflickr.com/\(iconserver)/buddyicons/\(owner).jpg")
            : URL(string: "https://www.flickr.com/images/buddyicon.gif")
        }
      }
    }
  }
  
  init(from decoder: Decoder) throws {
    let response = try Response(from: decoder)
    photos = response.photos?.photo.map {
      FeedsPhoto(
        avatarURL: $0.avatarURL(),
        userName: $0.ownername,
        imageURL: URL(string: $0.urlZ),
        title: $0.title,
        favoritesCount: $0.countFaves,
        viewsCount: $0.views,
        commentsCount: $0.countComments
      )
    }
    stats = ResponseStats(stat: response.stat, code: response.code, message: response.message)
  }
}
