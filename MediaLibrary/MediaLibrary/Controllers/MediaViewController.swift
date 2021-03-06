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
  
  var mediaItems: Feeds? {
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
      view.backgroundColor = .white
      getMediaItems()
      setUpViewConstraints()
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
 private func setUpViewConstraints(){
    
    mediaView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    mediaView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    mediaView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    mediaView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    
  }
}
extension MediaViewController: UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let item = mediaItems?.results.count{
      return item
    }
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = mediaView.mediaDisplayTableView.dequeueReusableCell(withIdentifier: "MediaCell", for: indexPath) as? MediaCell else { fatalError("Cell with identifier MediaCell")}
    if let mediaItem = mediaItems?.results[indexPath.row]{
    cell.itemName.text = mediaItem.artistName
    getItemImage(urlString: mediaItem.artworkUrl100, imageView: cell.mediaTypeImage)
      
      if let mediaType = mediaItems?.title{
        cell.itemType.text = mediaType
      }
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let mediaItem = mediaItems?.results[indexPath.row]{
      let itemDetailledViewController = ItemDetailledViewController.init(item: mediaItem)
        itemDetailledViewController.modalPresentationStyle = .overCurrentContext
        itemDetailledViewController.modalTransitionStyle = .coverVertical
        self.present(itemDetailledViewController, animated: true, completion: nil)
      
    }
  }
 
}
extension MediaViewController: UITableViewDelegate{
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Media Type: Music Video"
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return CGFloat.init(120)
  }
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    setUpViewConstraints()
  }
  }
