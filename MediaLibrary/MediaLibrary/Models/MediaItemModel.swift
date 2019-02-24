//
//  MediaItemModel.swift
//  MediaLibrary
//
//  Created by Ashli Rankin on 2/22/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import Foundation

struct MediaItem:Codable {
  let feed: Feeds
}
struct Feeds:Codable {
  let title: String
  let results: [Results]
}
struct Results:Codable {
  let artistName : String
  let releaseDate: String
  let name: String
  let kind: String
  let copyright: String
  let artistUrl: URL
  let artworkUrl100 : String
  
}
