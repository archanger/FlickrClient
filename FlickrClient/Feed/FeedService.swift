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
  
  //flickr.interestingness.getList
  //flickr.photos.getRecent
  private let _networkProvider: AbstractNetworkProvider
  private let _entrypoint = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=60b315cbccf376cbdb986492ded229ab&tags=recipe&format=json&nojsoncallback=1&extras=original_format,description,count_faves,count_comments,owner_name,url_z,views,icon_server&sort=interestingness-desc"
}

extension FeedService: FeedServiceProtocol {
  func receiveList(onComlete: @escaping ([FeedsPhoto]) -> Void, onFailure: @escaping (Error) -> Void) {
    
    guard let url = URL(string: _entrypoint) else {
      onFailure(NSError(domain: "", code: 101, userInfo: [NSLocalizedDescriptionKey: "Wrong URL"]))
      return
    }
    
    _networkProvider.makeGetRequest(
      with: url,
      onSuccess: { (data: FeedsPhotoCollectionResponse) in
          guard data.stats.stat == "ok" else {
            onFailure(NSError(domain: "", code: 108, userInfo: [NSLocalizedDescriptionKey: data.stats.message ?? ""]))
            return
          }
          
          guard let photos = data.photos else {
            onFailure(NSError(domain: "", code: 107, userInfo: [NSLocalizedDescriptionKey: "Empty Collection"]))
            return
          }
          onComlete(photos)
      },
      onError: onFailure
    )
  }
}
