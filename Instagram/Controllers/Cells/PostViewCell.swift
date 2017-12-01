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
    
    func setOutlets(profileImage: URL, username: String, contentImage: UIImage, caption: String, imageURL: URL) {
        self.usernameButton.setTitle(username, for: .normal)
        self.captionLabelView.text = "\(username): \(caption)"
        downloadImage(url: imageURL)
        downloadProfilePic(url: profileImage)
    }
    
    func downloadImage(url: URL) {
        let request = URLRequest(url: url)
        
         let session = URLSession.shared
         let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let imageData = data else { return }
                self.contentImageView.image = UIImage(data: imageData)
            }
         }
        task.resume()
 
        /*
        NSURLConnection.sendAsynchronousRequest(request, queue: .main) { (response, data, error) in
            guard let data = data else { return }
            self.contentImageView.image = UIImage(data: data)
        }
         */
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
        delegate.willOpenProfile(named: (usernameButton.titleLabel?.text)!)
        
    }
    
    

}
