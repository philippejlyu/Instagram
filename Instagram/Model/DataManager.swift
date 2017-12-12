//
//  DataManager.swift
//  Instagram
//
//  Created by Philippe Yu on 2017-12-12.
//  Copyright © 2017 Philippe Yu. All rights reserved.
//

import UIKit

class DataManager {
    func getJSONString(_ url: URL) -> [Post] {
        var posts: [Post] = []
        do {
            //Safely unwrap the JSON data
            if let data = NSData(contentsOf: url),
                let json = try JSONSerialization.jsonObject(with: data as Data) as? [String: Any],
                let results = json["results"] as? [[String: Any]] {
                //Parse the JSON data
                for result in results {
                    let newPost = Post(imageURL: URL(string: result["imageURL"] as! String)!, caption: result["caption"] as! String, username: result["username"] as! String, userProfilePic: URL(string: result["userProfilePic"] as! String)!)
                    posts.append(newPost)
                }
            }
        } catch {
            fatalError()
        }
        
        return posts
    }
}
