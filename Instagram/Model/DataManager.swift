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
    
    func downloadJSONString(_ url: URL, delegate: PostCellDelegate, completionHandler: @escaping ([Post]) -> Void) {
        //Create the request
        let request = URLRequest(url: url)
        DispatchQueue.main.async {
            let session = URLSession.shared
            let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
                var posts: [Post] = []
                do {
                    guard let json = try JSONSerialization.jsonObject(with: data!) as? [String: Any] else { return }
                    guard let results = json["results"] as? [[String: Any]] else { return }
                    for result in results {
                        let newPost = Post(imageURL: URL(string: result["imageURL"] as! String)!, caption: result["caption"] as! String, username: result["username"] as! String, userProfilePic: URL(string: result["userProfilePic"] as! String)!, delegate: delegate)
                        newPost.getContentImage()
                        posts.append(newPost)
                    }
                    
                } catch {
                    fatalError()
                }
                completionHandler(posts)
            })
            task.resume()
        }
    }
    
    func downloadImage(url: URL, completionHandler: @escaping (UIImage) -> Void) {
        let request = URLRequest(url: url)
        DispatchQueue.main.async {
            let session = URLSession.shared
            let task = session.dataTask(with: request) { (data, response, error) in
                guard let imageData = data else { return }
                completionHandler(UIImage(data: imageData)!)
            }
            task.resume()
        }
    }
    
    func getAttributedString(username: String, text: String) -> NSMutableAttributedString {
        //Create the bold attribute
        let boldAttribute = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 17.0)]
        //Create the regular attribute
        let regAttribute = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17.0)]
        //Create the username text and make it bold
        let usernameText = NSMutableAttributedString(string: username, attributes: boldAttribute)
        //Create the caption and the complete caption variables. Put a space before you actually start the text
        let captionText = NSMutableAttributedString(string: " \(text)", attributes: regAttribute)
        let completeCaption = NSMutableAttributedString()
        //Add the two parts to the complete caption
        completeCaption.append(usernameText)
        completeCaption.append(captionText)
        
        return completeCaption
    }
}
