//
//  ViewController.swift
//  Instagram
//
//  Created by Philippe Yu on 2017-10-20.
//  Copyright © 2017 Philippe Yu. All rights reserved.
//  http://swiftjson.guide

import UIKit

class ViewController: UITableViewController, PostCellDelegate {
    
    //MARK: - Properties
    var usernameToSend = ""
    var profilePictureToSend = UIImage()
    var profileToSend: User!
    var posts = [Post]()
    let dataManager = DataManager()
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataManager.downloadJSONString(URL(string: "https://raw.githubusercontent.com/philippejlyu/Instagram/master/Instagram/images.json")!, delegate: self) { (post) in            
                DispatchQueue.main.async {
                    self.posts = post
                    self.tableView.reloadData()
                }
            }
        let url = Bundle.main.url(forResource: "images", withExtension: "json")
        //self.posts = dataManager.getJSONString(url!)
        
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Add 1 to # of posts because of the stories.
        return posts.count + 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "storiesCell", for: indexPath) as! StoriesTableViewCell
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostViewCell
            cell.delegate = self
            let postRef = posts[indexPath.row-1] //Subtract one because of stories
            
            //TODO
            
            cell.setOutlets(profileImage: postRef.userProfilePic, username: postRef.username, contentImage: postRef.contentImage, caption: postRef.caption, imageURL: postRef.imageURL)
            
            return cell
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            //Set the height for stories
            return 93.5
        } else {
            //Set the height for the rest of the cells
            return 485.0
        }
    }
    
    //MARK: - Post Cell delegate
    /*
     -This is used to open the user profile. When the button in the table view cell is pressed, this code will run
    */
    func willOpenProfile(named: String, profilePicture: URL) {
        self.usernameToSend = named
        self.profileToSend = User(followers: 200, posts: self.posts, following: 245, profilePic: profilePicture, description: "I am a great person. CEO of the world coroporation, President of Mars, politician", realName: "President Kang")
        performSegue(withIdentifier: "showProfile", sender: self)
    }
    
    func reloadTableViewData() {
        self.tableView.reloadData()
    }

    
    // MARK: - Navigation
     
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showProfile" {
            let dest = segue.destination as! ProfileViewController
            dest.ownProfile = false
            dest.username = self.usernameToSend
            dest.user = self.profileToSend
        }
    }   

}
