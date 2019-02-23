//
//  MediaViewController.swift
//  MediaLibrary
//
//  Created by Ashli Rankin on 2/22/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class MediaViewController: UIViewController {

    let mediaView = MediaView()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      view.addSubview(mediaView)
      self.navigationItem.title = "Media Library"
      mediaView.mediaDisplayTableView.dataSource = self
      mediaView.mediaDisplayTableView.delegate = self
      
    }
  

}
extension MediaViewController: UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = mediaView.mediaDisplayTableView.dequeueReusableCell(withIdentifier: "MediaCell", for: indexPath) as? MediaCell else { fatalError("Cell with identifier MediaCell")}
    return cell
  }
  
  
}
extension MediaViewController: UITableViewDelegate{
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Media Types"
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return CGFloat.init(120)
  }
}
