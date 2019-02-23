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
   
    return view
  }()
  let displayView:UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.layer.cornerRadius = 10
    view.layer.masksToBounds = true
    return view
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
  }
  func setUpDisplayView(){
    visualEffectsViews.contentView.addSubview(displayView)
    displayView.translatesAutoresizingMaskIntoConstraints = false
    displayView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    displayView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
    displayView.heightAnchor.constraint(equalToConstant: 500).isActive = true
    displayView.widthAnchor.constraint(equalToConstant: 300).isActive = true
  }
}
