//
//  Post.swift
//  Instagram
//
//  Created by Philippe Yu on 2017-10-22.
//  Copyright © 2017 Philippe Yu. All rights reserved.
//

import UIKit

class Post: Codable {
    
    //MARK: - Properties
    var imageURL: String
    var caption: String
    var poster: String
    
    //MARK: - Initializers
    init(imageURL: String, caption: String, poster: String) {
        self.imageURL = imageURL
        self.caption = caption
        self.poster = poster
    }
}
