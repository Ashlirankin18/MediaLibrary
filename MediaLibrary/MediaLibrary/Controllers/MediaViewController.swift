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
  var mediaItems = [Results](){
    didSet{
      DispatchQueue.main.async {
        self.mediaView.mediaDisplayTableView.reloadData()
      }
    }
  }
    override func viewDidLoad() {
        super.viewDidLoad()
      view.addSubview(mediaView)
      self.navigationItem.title = "Media Library"
      mediaView.mediaDisplayTableView.dataSource = self
      mediaView.mediaDisplayTableView.delegate = self
      getMediaItems()
    }
  private func getMediaItems(){
    MediaApiClient.getMediaItems { (error, mediaItems) in
      if let error = error {
      print(error.errorMessage())
      }
      if let mediaItems = mediaItems {
        self.mediaItems = mediaItems
      }
    }
  }
  private func getItemImage(urlString:String,imageView:UIImageView){
    if let image = ImageCache.shared.fetchImageFromCache(urlString: urlString){
      DispatchQueue.main.async {
        imageView.image = image
      }
    }else{
      ImageCache.shared.fetchImageFromNetwork(urlString: urlString) { (error, image) in
        if let error = error {
          print(error.errorMessage())
        }
        if let image = image {
          DispatchQueue.main.async{
          imageView.image = image
          }
        }
      }
    }
  }

}
extension MediaViewController: UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return mediaItems.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = mediaView.mediaDisplayTableView.dequeueReusableCell(withIdentifier: "MediaCell", for: indexPath) as? MediaCell else { fatalError("Cell with identifier MediaCell")}
    let mediaItem = mediaItems[indexPath.row]
    cell.itemName.text = mediaItem.artistName
    cell.itemType.text = mediaItem.kind.capitalized
    getItemImage(urlString: mediaItem.artworkUrl100, imageView: cell.mediaTypeImage)
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
