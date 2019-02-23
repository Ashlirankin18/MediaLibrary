//
//  MediaView.swift
//  MediaLibrary
//
//  Created by Ashli Rankin on 2/22/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class MediaView: UIView {

  lazy var mediaDisplayTableView:UITableView = {
    let tableView = UITableView(frame: frame, style: .grouped)
    tableView.backgroundColor = .white
    tableView.register(MediaCell.self, forCellReuseIdentifier: "MediaCell")
    return tableView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  func commonInit(){
    setUpViews()
    backgroundColor = .white
  }
  
}
extension MediaView {
  func setUpViews(){
    setUpMediaTableViewConstraints()
  }
  
  func setUpMediaTableViewConstraints(){
    addSubview(mediaDisplayTableView)
    mediaDisplayTableView.translatesAutoresizingMaskIntoConstraints = false
    mediaDisplayTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
    mediaDisplayTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
    mediaDisplayTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    mediaDisplayTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    
  }
  
}
