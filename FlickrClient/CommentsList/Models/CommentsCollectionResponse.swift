//
//  CommentsCollectionResponse.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 20/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import Foundation

struct CommentsCollectionResponse {
  let comments: [Comment]?
  let stats: ResponseStats
}

extension CommentsCollectionResponse: Decodable {
  private struct Response: Decodable, ResponseStatsRepresentable {
    let comments: Comments?
    let stat: String
    let code: Int?
    let message: String?
    
    struct Comments: Decodable {
      let comment: [ResponseComment]
      
      struct ResponseComment: Decodable, AvatarRepresentable, UsernameRepresentable {
        let id: String
        let author: String
        let iconserver: String
        let iconfarm: Int
        let authorname: String
        let realname: String
        let _content: String
        let datecreate: String
        var nsid: String {
          return author
        }
        var username: String {
          return authorname
        }
      }
    }
  }
  
  init(from decoder: Decoder) throws {
    let response = try Response(from: decoder)
    comments = response.comments?.comment.map {
      Comment(
        id: $0.id,
        creationDate: TimeInterval($0.datecreate) ?? 0,
        username: $0.username(),
        avatarURL: $0.avatarURL(),
        content: $0._content
      )
    }
    stats = response.responseStats
  }
}
