//
//  FeedInfoView.swift
//  FlickrClient
//
//  Created by Кирилл Чуянов on 17/10/2018.
//  Copyright © 2018 Kirill Chuyanov. All rights reserved.
//

import UIKit

extension FeedInfoView {
  struct Model {
    let favoritesModel: IconedInfoView.Model
    let viewsModel: IconedInfoView.Model
    let commentsModel: IconedInfoView.Model
  }
}

final class FeedInfoView: UIView {
  func update(model: Model) {
    favoritesView.update(model: model.favoritesModel)
    viewsView.update(model: model.viewsModel)
    commentsView.update(model: model.commentsModel)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(favoritesView)
    addSubview(viewsView)
    addSubview(commentsView)
    
    favoritesView.translatesAutoresizingMaskIntoConstraints = false
    viewsView.translatesAutoresizingMaskIntoConstraints = false
    commentsView.translatesAutoresizingMaskIntoConstraints = false
    
    let spacer1 = UILayoutGuide()
    addLayoutGuide(spacer1)
    
    let spacer2 = UILayoutGuide()
    addLayoutGuide(spacer2)
    
    let margins = layoutMarginsGuide
    
    spacer1.widthAnchor.constraint(equalTo: spacer2.widthAnchor).isActive = true
    
    favoritesView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
    favoritesView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    
    viewsView.centerYAnchor.constraint(equalTo: favoritesView.centerYAnchor).isActive = true
    commentsView.centerYAnchor.constraint(equalTo: favoritesView.centerYAnchor).isActive = true
    
    favoritesView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
    favoritesView.trailingAnchor.constraint(equalTo: spacer1.leadingAnchor).isActive = true
    viewsView.leadingAnchor.constraint(equalTo: spacer1.trailingAnchor).isActive = true
    viewsView.trailingAnchor.constraint(equalTo: spacer2.leadingAnchor).isActive = true
    commentsView.leadingAnchor.constraint(equalTo: spacer2.trailingAnchor).isActive = true
    commentsView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private let favoritesView = IconedInfoView()
  private let viewsView = IconedInfoView()
  private let commentsView = IconedInfoView()
}
