//
//  ResponseStats.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 19/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import Foundation

struct ResponseStats {
  let stat: String
  let code: Int?
  let message: String?
}

protocol ResponseStatsRepresentable {
  var stat: String { get }
  var code: Int? { get }
  var message: String? { get }
}

extension ResponseStatsRepresentable {
  var responseStats: ResponseStats {
    return ResponseStats(stat: stat, code: code, message: message)
  }
}
