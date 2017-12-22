//
//  Post.swift
//  Instagram
//
//  Created by Philippe Yu on 2017-10-22.
//  Copyright © 2017 Philippe Yu. All rights reserved.
//

import UIKit

class Post {
    var imageURL: URL
    var caption: String
    var username: String
    var userProfilePic: URL
    var contentImage: UIImage = UIImage()
    var profileImage: UIImage = UIImage()
    var delegate: PostCellDelegate?
    
    init(imageURL: URL, caption: String, username: String, userProfilePic: URL) {
        self.imageURL = imageURL
        self.caption = caption
        self.username = username
        self.userProfilePic = userProfilePic
    }
    
    init(imageURL: URL, caption: String, username: String, userProfilePic: URL, delegate: PostCellDelegate) {
        self.imageURL = imageURL
        self.caption = caption
        self.username = username
        self.userProfilePic = userProfilePic
        self.delegate = delegate
    }
    
    func getContentImage() {
        DataManager().downloadImage(url: imageURL) { (contentImage) in
            DispatchQueue.main.async {
                self.contentImage = contentImage
                self.delegate?.reloadTableViewData()
            }
            
        }
    }
}
