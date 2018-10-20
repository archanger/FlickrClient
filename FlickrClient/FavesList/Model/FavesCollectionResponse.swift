//
//  FavesCollectionResponse.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 20/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import Foundation

struct FavesCollectionResponse {
  let faves: [Fave]?
  let stats: ResponseStats
}

extension FavesCollectionResponse: Decodable {
  private struct Response: Decodable, ResponseStatsRepresentable {
    let photo: Photo?
    let stat: String
    let code: Int?
    let message: String?
    
    struct Photo: Decodable {
      let person: [ResponsePerson]
      
      struct ResponsePerson: Decodable {
        let nsid: String
        let username: String
        let realname: String
        let favedate: String
        let iconserver: String
        let iconfarm: Int
        
        func avatarURL() -> URL? {
          return (Int(iconserver) ?? 0) > 0
            ? URL(string: "https://farm\(iconfarm).staticflickr.com/\(iconserver)/buddyicons/\(nsid).jpg")
            : URL(string: "https://www.flickr.com/images/buddyicon.gif")
        }
        
        func name() -> String {
          return realname.isEmpty
            ? username
            : realname
        }
      }
    }
  }
  
  init(from decoder: Decoder) throws {
    let response = try Response(from: decoder)
    faves = response.photo?.person.map {
      Fave(
        id: $0.nsid,
        username: $0.name(),
        date: TimeInterval($0.favedate) ?? 0
      )
    }
    stats = response.responseStats
  }
  
}
