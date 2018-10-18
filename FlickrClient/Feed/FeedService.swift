//
//  FeedService.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 18/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import Foundation

final class FeedService {
  init(networkProvider: AbstractNetworkProvider) {
    _networkProvider = networkProvider
  }
  
  private let _networkProvider: AbstractNetworkProvider
}

extension FeedService: FeedServiceProtocol {
  func receiveList(onComlete: @escaping ([FeedsPhoto]) -> Void, onFailure: @escaping (Error) -> Void) {
    
    let result = [
      FeedsPhoto(
        avatarURL: URL(string: "https://res.grouple.co/static/no_avatar_small.png"),
        userName: "User1",
        imageURL: URL(string: "https://theme.zdassets.com/theme_assets/14924/4ae977d85a3cd2600e7fccd7d01498b270650559.png"),
        title: "Title1",
        favoritesCount: "100",
        viewsCount: "50",
        commentsCount: "4"
      ),
      FeedsPhoto(
        avatarURL: URL(string: "https://res.grouple.co/static/no_avatar_small.png"),
        userName: "User2",
        imageURL: URL(string: "https://theme.zdassets.com/theme_assets/14924/4ae977d85a3cd2600e7fccd7d01498b270650559.png"),
        title: "Title2",
        favoritesCount: "102",
        viewsCount: "52",
        commentsCount: "42"
      ),
      FeedsPhoto(
        avatarURL: URL(string: "https://res.grouple.co/static/no_avatar_small.png"),
        userName: "User3",
        imageURL: URL(string: "https://theme.zdassets.com/theme_assets/14924/4ae977d85a3cd2600e7fccd7d01498b270650559.png"),
        title: "Title3",
        favoritesCount: "103",
        viewsCount: "53",
        commentsCount: "403"
      ),
      FeedsPhoto(
        avatarURL: URL(string: "https://res.grouple.co/static/no_avatar_small.png"),
        userName: "User4",
        imageURL: URL(string: "https://theme.zdassets.com/theme_assets/14924/4ae977d85a3cd2600e7fccd7d01498b270650559.png"),
        title: "Title4",
        favoritesCount: "1004",
        viewsCount: "5004",
        commentsCount: "4201"
      ),
      FeedsPhoto(
        avatarURL: URL(string: "https://res.grouple.co/static/no_avatar_small.png"),
        userName: "User5",
        imageURL: URL(string: "https://theme.zdassets.com/theme_assets/14924/4ae977d85a3cd2600e7fccd7d01498b270650559.png"),
        title: "Title5",
        favoritesCount: "1000002",
        viewsCount: "505",
        commentsCount: "41214"
      )
    ]
    
    onComlete(result)
  }
}
