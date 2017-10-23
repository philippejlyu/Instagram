//
//  Post.swift
//  Instagram
//
//  Created by Philippe Yu on 2017-10-22.
//  Copyright © 2017 Philippe Yu. All rights reserved.
//

import UIKit

struct Post: Codable {
    var imageURL: URL
    var caption: String
    var username: String
    var userProfilePic: URL
    
}
