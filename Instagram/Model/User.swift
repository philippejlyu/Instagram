//
//  User.swift
//  Instagram
//
//  Created by Philippe Yu on 2017-10-22.
//  Copyright © 2017 Philippe Yu. All rights reserved.
//

import UIKit

struct User: Codable {
    var followers: Int
    var posts: [Post]
    var following: Int
    var profilePic: URL
    var description: String
    var realName: String
}
