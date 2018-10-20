//
//  FaveService.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 20/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import Foundation

final class FaveService {
  init(networkProvider: AbstractNetworkProvider) {
    _networkProvider = networkProvider
  }
  
  private let _networkProvider: AbstractNetworkProvider
  private let _entrypoint = "https://api.flickr.com/services/rest/?method=flickr.photos.getFavorites&api_key=60b315cbccf376cbdb986492ded229ab&photo_id=%@&format=json&nojsoncallback=1&per_page=100"
}

extension FaveService: FavesServiceProtocol {
  func receiveList(
    for photoID: String,
    onComlete: @escaping ([Fave]) -> Void,
    onFailure: @escaping (Error) -> Void
  ) {
    guard let url = URL(string: String(format: _entrypoint, photoID) ) else {
      onFailure(NSError(domain: "", code: 101, userInfo: [NSLocalizedDescriptionKey: "Wrong URL"]))
      return
    }
    
    _networkProvider.makeGetRequest(
      with: url,
      onSuccess: { (data: FavesCollectionResponse) in
        guard data.stats.stat == "ok" else {
          onFailure(NSError(domain: "", code: 108, userInfo: [NSLocalizedDescriptionKey: data.stats.message ?? ""]))
          return
        }
        
        guard let faves = data.faves else {
          onFailure(NSError(domain: "", code: 107, userInfo: [NSLocalizedDescriptionKey: "Empty Collection"]))
          return
        }
        onComlete(faves)
      },
      onError: onFailure
    )
  }
}
