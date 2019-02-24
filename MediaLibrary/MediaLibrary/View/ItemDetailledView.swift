//
//  DetailledView.swift
//  MediaLibrary
//
//  Created by Ashli Rankin on 2/22/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class ItemDetailledView: UIView {

  lazy var visualEffectsViews:UIVisualEffectView = {
    let view = UIVisualEffectView()
    view.effect = UIBlurEffect(style: .dark)
    view.contentMode = .scaleAspectFit
    return view
  }()
  let displayView:UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.layer.cornerRadius = 10
    view.layer.masksToBounds = true
    view.contentMode = .scaleAspectFit
    return view
  }()
  lazy var mediaTypeImage:UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "imageHolder")
    imageView.backgroundColor = .red
    imageView.layer.masksToBounds = true
    imageView.layer.cornerRadius = 8
    
    return imageView
    
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
    label.contentMode = .scaleAspectFit
    return label
  }()
  lazy var itemDescription:UITextView = {
    let textView = UITextView()
    textView.layer.cornerRadius = 5
    textView.layer.borderWidth = 2
    textView.layer.borderColor = UIColor.black.cgColor
    textView.text = "Item description"
    textView.backgroundColor = #colorLiteral(red: 0.9580904876, green: 1, blue: 0.9470090475, alpha: 1)
    textView.textAlignment = .center
    textView.dataDetectorTypes = .link
    textView.isEditable = false
    textView.isScrollEnabled = false
    textView.contentMode = .scaleAspectFit
    return textView
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
  backgroundColor = .clear
  contentMode = .scaleAspectFit
  }

}
extension ItemDetailledView {
  func setUpViews(){
    setUpVisualEffectViewConstraints()
  }
  
  func setUpVisualEffectViewConstraints(){
    addSubview(visualEffectsViews)
    
    visualEffectsViews.translatesAutoresizingMaskIntoConstraints = false
    visualEffectsViews.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
    visualEffectsViews.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    visualEffectsViews.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
    visualEffectsViews.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    setUpDisplayView()
    setUpMediaImageConstraints()
    setUpMediaNameConstraints()
    setUpMediaDescriptionConstraints()
  }
  func setUpDisplayView(){
    visualEffectsViews.contentView.addSubview(displayView)
    displayView.translatesAutoresizingMaskIntoConstraints = false
    displayView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    displayView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
    displayView.heightAnchor.constraint(equalToConstant: 500).isActive = true
    displayView.widthAnchor.constraint(equalToConstant: 300).isActive = true
  }
  func setUpMediaImageConstraints(){
    displayView.addSubview(mediaTypeImage)
    mediaTypeImage.translatesAutoresizingMaskIntoConstraints = false
    mediaTypeImage.topAnchor.constraint(equalToSystemSpacingBelow: displayView.topAnchor, multiplier: 2.0).isActive = true
   mediaTypeImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
    mediaTypeImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
    mediaTypeImage.centerXAnchor.constraint(equalTo: displayView.centerXAnchor).isActive = true
  }
  func setUpMediaNameConstraints(){
    displayView.addSubview(itemName)
    itemName.translatesAutoresizingMaskIntoConstraints = false
    itemName.topAnchor.constraint(equalToSystemSpacingBelow: mediaTypeImage.bottomAnchor, multiplier: 2.0).isActive = true
    itemName.widthAnchor.constraint(equalToConstant: 200).isActive = true
   itemName.heightAnchor.constraint(equalToConstant: 35).isActive = true
    itemName.centerXAnchor.constraint(equalTo: displayView.centerXAnchor).isActive = true
  }
  
  func setUpMediaDescriptionConstraints(){
    displayView.addSubview(itemDescription)
    itemDescription.translatesAutoresizingMaskIntoConstraints = false
    itemDescription.topAnchor.constraint(equalToSystemSpacingBelow: itemName.bottomAnchor, multiplier: 2.0).isActive = true
    itemDescription.widthAnchor.constraint(equalToConstant: 250).isActive = true
    itemDescription.heightAnchor.constraint(equalToConstant: 200).isActive = true
    itemDescription.centerXAnchor.constraint(equalTo: displayView.centerXAnchor).isActive = true
  }
  
}
