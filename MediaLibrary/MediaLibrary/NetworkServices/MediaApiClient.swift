//
//  MediaApiClient.swift
//  MediaLibrary
//
//  Created by Ashli Rankin on 2/22/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import Foundation

final class MediaApiClient{
  static func getMediaItems(completionHendler: @escaping (AppError?,[Results]?) -> Void){
    let urlString = "https://rss.itunes.apple.com/api/v1/us/music-videos/top-music-videos/all/10/explicit.json"
    NetworkHelper.shared.performDataTask(endpointURLString: urlString, httpMethod: "GET", httpBody: nil) { (error, data) in
      if let error = error {
       completionHendler(AppError.badURL(error.errorMessage()),nil)
      }
      if let data = data {
        do{
          let mediaItems = try JSONDecoder().decode(MediaItem.self, from: data)
          let results = mediaItems.feed.results
          completionHendler(nil,results)
        }catch{
          completionHendler(AppError.jsonDecodingError(error),nil)
        }
      }
    }
  }
}
