//
//  User.swift
//  Instagram
//
//  Created by Philippe Yu on 2017-10-22.
//  Copyright © 2017 Philippe Yu. All rights reserved.
//

import UIKit

class User: Codable {
    //MARK: - Properties
    var followers: Int
    var posts: [Post]
    var following: Int
    var profilePic: String
    
    //MARK: - Initializers
    init(followers: Int, posts: [Post], following: Int, profilePic: String) {
        self.followers = followers
        self.posts = posts
        self.followers = followers
        self.following = following
        self.profilePic = profilePic
    }
    
}
