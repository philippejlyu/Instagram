//
//  StoriesCollectionViewCell.swift
//  Instagram
//
//  Created by Philippe Yu on 2017-12-01.
//  Copyright © 2017 Philippe Yu. All rights reserved.
//

import UIKit

class StoriesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var storyImageView: UIImageView!
    
    func setup() {
        self.storyImageView.layer.cornerRadius = 25.0
        self.storyImageView.clipsToBounds = true
    }
}
