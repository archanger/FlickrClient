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
  private let _entrypoint = "https://api.flickr.com/services/rest/?method=flickr.interestingness.getList&api_key=55ab2f1fa8ca6c25c2d68ac1b46a1ecf&format=json&extras=description,count_faves,count_comments,owner_name,url_z,views,icon_server&nojsoncallback=1"
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
