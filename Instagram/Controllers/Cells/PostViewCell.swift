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
    
    func setOutlets(profileImage: UIImage, username: String, contentImage: UIImage, caption: String, imageURL: URL) {
        self.profileImageView.image = profileImage
        self.usernameButton.setTitle(username, for: .normal)
        self.captionLabelView.text = "\(username): \(caption)"
        downloadImage(url: imageURL)
    }
    
    func downloadImage(url: URL) {
        let request = URLRequest(url: url)
        
         let session = URLSession.shared
         let task = session.dataTask(with: request) { (data, response, error) in
         guard let imageData = data else { return }
            DispatchQueue.main.async {
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
    
    @IBAction func usernameClicked() {
        delegate.willOpenProfile(named: (usernameButton.titleLabel?.text)!)
        
    }
    
    

}
