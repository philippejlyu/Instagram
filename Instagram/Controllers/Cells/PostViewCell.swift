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
    let manager = DataManager()
    var profileImage: URL!
    
    //MARK: - Outlets
    @IBOutlet weak var captionTextView: UITextView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.profileImageView.layer.cornerRadius = 20.0
        self.profileImageView.clipsToBounds = true
    }
    
    //MARK: - Setting up
    
    func setOutlets(profileImage: URL, username: String, contentImage: UIImage, caption: String, imageURL: URL) {
        self.usernameButton.setTitle(username, for: .normal)
        self.profileImage = profileImage
        self.captionTextView.attributedText = manager.getAttributedString(username: username, text: caption)
        downloadImages(contentImage: imageURL, profileImage: profileImage)
    }
    
    func downloadImages(contentImage: URL, profileImage: URL) {
        //Download the content image view
        //Create a custom conqurrent queue that runs on the main thread so that UI updates happen instantly
        let queue = DispatchQueue(label: "com.philippe.\(contentImage)", qos: .userInteractive, attributes: .concurrent, target: DispatchQueue.main)
        
        manager.downloadImage(url: contentImage) { (image) in
            queue.async {
                self.contentImageView.image = image
                self.activityIndicator.stopAnimating()
            }
        }
        
        //Download the profile picture
        manager.downloadImage(url: profileImage) { (image) in
            queue.async {
                self.profileImageView.image = image
            }
        }
    }
    
    func downloadProfilePic(url: URL) {
        let request = URLRequest(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let imageData = data else { return }
                self.profileImageView.image = UIImage(data: imageData)
            }
            
        }
        task.resume()
    }
    
    @IBAction func usernameClicked() {
        delegate.willOpenProfile(named: (usernameButton.titleLabel?.text)!, profilePicture: self.profileImage)
        
    }
}
