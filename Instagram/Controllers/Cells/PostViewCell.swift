//
//  PostViewCell.swift
//  Instagram
//
//  Created by Philippe Yu on 2017-10-20.
//  Copyright © 2017 Philippe Yu. All rights reserved.
//

import UIKit

class PostViewCell: UITableViewCell {
    
    //MARK: - Properties
    var delegate: PostCellDelegate!
    
    //MARK: - Outlets
    @IBOutlet weak var captionLabelView: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameButton: UIButton!
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.profileImageView.layer.cornerRadius = 20.0
        self.profileImageView.clipsToBounds = true
    }
    
    //MARK: - Setting up
    
    func setOutlets(profileImage: UIImage, username: String, contentImage: UIImage, caption: String) {
        self.profileImageView.image = profileImage
        self.contentImageView.image = contentImage
        self.usernameButton.setTitle(username, for: .normal)
        self.captionLabelView.text = "\(username): \(caption)"
    }
    
    @IBAction func usernameClicked() {
        delegate.willOpenProfile(named: (usernameButton.titleLabel?.text)!)
        
    }
    
    

}
