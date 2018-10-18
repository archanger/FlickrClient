//
//  AbstractNetworkProvider.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 18/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import Foundation

class AbstractNetworkProvider {
  func makeGetRequest<ResponseType: Decodable>(with url: URL, onSuccess: @escaping (ResponseType) -> Void, onError: @escaping (Error) -> Void) {
    fatalError("Need to be implemented")
  }
}

final class NetworkProvider: AbstractNetworkProvider {
  override func makeGetRequest<ResponseType>(
    with url: URL,
    onSuccess: @escaping (ResponseType) -> Void,
    onError: @escaping (Error) -> Void)
    where ResponseType : Decodable
  {
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard error == nil else {
        onError(error!)
        return
      }
      
      guard let data = data else {
        onError(NSError(domain: "", code: 999, userInfo: [NSLocalizedDescriptionKey: "Something was wrong"]))
        return
      }
      
      do {
        let result = try JSONDecoder().decode(ResponseType.self, from: data)
        onSuccess(result)
      } catch {
        onError(error)
      }
    }.resume()
  }
}
