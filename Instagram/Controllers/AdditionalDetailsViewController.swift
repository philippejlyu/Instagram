//
//  AdditionalDetailsViewController.swift
//  Instagram
//
//  Created by Philippe Yu on 2017-12-20.
//  Copyright © 2017 Philippe Yu. All rights reserved.
//

import UIKit

class AdditionalDetailsViewController: UITableViewController {

    //MARK: - Properties
    var post: Post!
    var manager = DataManager()
    
    //MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var captiontextView: UITextView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let post = post {
            getImages(contentImage: post.imageURL, profileImage: post.userProfilePic)
        }
    }

    //MARK: - Setup functions
    func getImages(contentImage: URL, profileImage: URL) {
        let queue = DispatchQueue(label: "com.philippe.\(contentImage)", qos: .userInteractive, attributes: .concurrent, target: DispatchQueue.main)
        manager.downloadImage(url: contentImage) { (image) in
            queue.async {
                self.imageView.image = image
                self.activityIndicator.stopAnimating()
            }
            
        }
        manager.downloadImage(url: profileImage) { (image) in
            queue.async {
                self.profilePicture.image = image
            }
            
        }
    }
    
    /*
    func getAttributedText(_ text: String) -> NSAttributedString {
        //TODO
    }
    */
    // MARK: - Table view data source

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
