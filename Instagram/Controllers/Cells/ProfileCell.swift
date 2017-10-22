//
//  ProfileCell.swift
//  Instagram
//
//  Created by Philippe Yu on 2017-10-22.
//  Copyright © 2017 Philippe Yu. All rights reserved.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    //MARK: - Outlets
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var postNumberLabel: UILabel!
    @IBOutlet weak var followerNumberLabel: UILabel!
    @IBOutlet weak var followingNumberLabel: UILabel!
    @IBOutlet weak var realNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //MARK: - UI Functions
    func setUI() {
        self.profilePicture.layer.cornerRadius = 40.0
        self.profilePicture.clipsToBounds = true
    }
}
