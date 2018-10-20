//
//  CommentsService.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 20/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import Foundation

final class CommentsService {
  init(networkProvider: AbstractNetworkProvider) {
    _networkProvider = networkProvider
  }
  
  private let _networkProvider: AbstractNetworkProvider
  private let _entrypoint = "https://api.flickr.com/services/rest/?method=flickr.photos.comments.getList&api_key=55ab2f1fa8ca6c25c2d68ac1b46a1ecf&photo_id=%@&format=json&nojsoncallback=1"
}

extension CommentsService: CommetnsServiceProtocol {
  func receiveList(
    for photoID: String,
    onComlete: @escaping ([Comment]) -> Void,
    onFailure: @escaping (Error) -> Void)
  {
    guard let url = URL(string: String(format: _entrypoint, photoID) ) else {
      onFailure(NSError(domain: "", code: 101, userInfo: [NSLocalizedDescriptionKey: "Wrong URL"]))
      return
    }
    
    _networkProvider.makeGetRequest(
      with: url,
      onSuccess: { (data: CommentsCollectionResponse) in
        guard data.stats.stat == "ok" else {
          onFailure(NSError(domain: "", code: 108, userInfo: [NSLocalizedDescriptionKey: data.stats.message ?? ""]))
          return
        }
        
        guard let comments = data.comments else {
          onFailure(NSError(domain: "", code: 107, userInfo: [NSLocalizedDescriptionKey: "Empty Collection"]))
          return
        }
        onComlete(comments)
      },
      onError: onFailure
    )
  }
}
