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
  lazy var itemName:UILabel = {
    let label = UILabel()
    label.layer.cornerRadius = 5
    label.layer.borderWidth = 2
    label.layer.borderColor = UIColor.black.cgColor
    label.text = "Item Name"
    label.backgroundColor = #colorLiteral(red: 0.9580904876, green: 1, blue: 0.9470090475, alpha: 1)
    label.textAlignment = .center
    label.adjustsFontSizeToFitWidth = true
    return label
  }()
  
  lazy var itemType:UILabel = {
    let label = UILabel()
    label.layer.cornerRadius = 5
    label.layer.borderWidth = 2
    label.layer.borderColor = UIColor.black.cgColor
    label.text = "Item Type"
    label.backgroundColor = #colorLiteral(red: 0.9580904876, green: 1, blue: 0.9470090475, alpha: 1)
    label.textAlignment = .center
    label.adjustsFontSizeToFitWidth = true
    return label
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
    setUpDividerViewConstraints()
    setUpItemNameConstraints()
    setUpItemTypeConstraints()
  }
  func setMediaImgaeConstraints(){
    addSubview(mediaTypeImage)
    mediaTypeImage.translatesAutoresizingMaskIntoConstraints = false
    mediaTypeImage.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 2.5).isActive = true
    mediaTypeImage.leadingAnchor.constraint(equalToSystemSpacingAfter: safeAreaLayoutGuide.leadingAnchor, multiplier: 2.0).isActive = true
    mediaTypeImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
    mediaTypeImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
  }
  func setUpDividerViewConstraints(){
    addSubview(dividerView)
    dividerView.translatesAutoresizingMaskIntoConstraints = false
    dividerView.leadingAnchor.constraint(equalToSystemSpacingAfter: mediaTypeImage.trailingAnchor, multiplier: 1.6).isActive = true
    dividerView.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 1.7).isActive = true
    dividerView.heightAnchor.constraint(equalToConstant: 95).isActive = true
    dividerView.widthAnchor.constraint(equalToConstant: 3).isActive = true
    
  }
  func setUpItemNameConstraints(){
    addSubview(itemName)
    itemName.translatesAutoresizingMaskIntoConstraints = false
    itemName.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 2.5).isActive = true
    itemName.leadingAnchor.constraint(equalToSystemSpacingAfter: dividerView.trailingAnchor, multiplier: 1.0).isActive = true
    itemName.heightAnchor.constraint(equalToConstant: 30).isActive = true
    itemName.widthAnchor.constraint(equalToConstant: 250).isActive = true
  }
  
  func setUpItemTypeConstraints(){
    addSubview(itemType)
    itemType.translatesAutoresizingMaskIntoConstraints = false
    itemType.topAnchor.constraint(equalToSystemSpacingBelow: itemName.bottomAnchor, multiplier: 2.5).isActive = true
    itemType.leadingAnchor.constraint(equalToSystemSpacingAfter: dividerView.trailingAnchor, multiplier: 1.0).isActive = true
    itemType.heightAnchor.constraint(equalToConstant: 30).isActive = true
    itemType.widthAnchor.constraint(equalToConstant: 130).isActive = true
  }
  
  
}
