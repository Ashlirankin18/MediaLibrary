//
//  MediaCell.swift
//  MediaLibrary
//
//  Created by Ashli Rankin on 2/22/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class MediaCell: UITableViewCell {
  
  lazy var mediaTypeImage:UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "imageHolder")
    imageView.backgroundColor = .red
    imageView.layer.masksToBounds = true
    imageView.layer.cornerRadius = 8
    return imageView
    
  }()
  lazy var dividerView:UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    return view
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .default, reuseIdentifier: "Media")
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  func commonInit(){
    setUpConstraints()
  }
  
  
  
}
extension MediaCell{
  func setUpConstraints(){
    setMediaImgaeConstraints()
  }
  func setMediaImgaeConstraints(){
    addSubview(mediaTypeImage)
    mediaTypeImage.translatesAutoresizingMaskIntoConstraints = false
    mediaTypeImage.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 3.5).isActive = true
    mediaTypeImage.leadingAnchor.constraint(equalToSystemSpacingAfter: safeAreaLayoutGuide.leadingAnchor, multiplier: 2.0).isActive = true
    mediaTypeImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
    mediaTypeImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
  }
  func setUpDividerViewConstraints(){
    addSubview(dividerView)
    dividerView.translatesAutoresizingMaskIntoConstraints = false
    
  }
  
}
