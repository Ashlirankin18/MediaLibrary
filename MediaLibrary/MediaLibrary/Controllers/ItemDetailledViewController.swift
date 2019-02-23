//
//  ItemDetailledViewController.swift
//  MediaLibrary
//
//  Created by Ashli Rankin on 2/23/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class ItemDetailledViewController: UIViewController {

  let itemDetailledView = ItemDetailledView()
  private var tapGesture: UITapGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
      view.addSubview(itemDetailledView)
      setUpTapGesture()
    }
  func setUpTapGesture(){
    tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissView))
    self.view.addGestureRecognizer(tapGesture)
  }
  
  @objc func dismissView(){
  dismiss(animated: true, completion: nil)
  }
    

    

}
