//
//  ActivityLikeCell.swift
//  Instagram
//
//  Created by Philippe Yu on 2017-10-21.
//  Copyright © 2017 Philippe Yu. All rights reserved.
//

import UIKit

class ActivityLikeCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImageView.layer.cornerRadius = 22.5
        profileImageView.clipsToBounds = true
    }

    //MARK: - Selecting
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
