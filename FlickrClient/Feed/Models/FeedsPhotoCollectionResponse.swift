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
        let farm: Int
        let server: String
        let ownername: String
        let urlZ: String?
        let title: String
        let countFaves: String
        let countComments: String
        let views: String
        let iconserver: String
        let iconfarm: Int
        let owner: String
        let originalformat: String?
        let originalsecret: String?
        
        func avatarURL() -> URL? {
          return (Int(iconserver) ?? 0) > 0
            ? URL(string: "https://farm\(iconfarm).staticflickr.com/\(iconserver)/buddyicons/\(owner).jpg")
            : URL(string: "https://www.flickr.com/images/buddyicon.gif")
        }
        
        func imageURL() -> URL? {
          return urlZ != nil
            ? URL(string: urlZ!)
            : URL(string: "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(originalsecret ?? "")_o.\(originalformat ?? "")")
        }
      }
    }
  }
  
  init(from decoder: Decoder) throws {
    let response = try Response(from: decoder)
    photos = response.photos?.photo.map {
      FeedsPhoto(
        id: $0.id,
        avatarURL: $0.avatarURL(),
        userName: $0.ownername,
        imageURL: $0.imageURL(),
        title: $0.title,
        favoritesCount: $0.countFaves,
        viewsCount: $0.views,
        commentsCount: $0.countComments
      )
    }
    stats = ResponseStats(stat: response.stat, code: response.code, message: response.message)
  }
}
