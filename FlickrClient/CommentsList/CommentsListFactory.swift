//
//  CommentsListFactory.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 19/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit

final class CommentsListFactory {
  func create(for photoId: String) -> UIViewController {
    print(photoId)
    let vc = CommentsListViewController()
    
    return vc
  }
}