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
    var posts = [Post]()
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = Bundle.main.url(forResource: "images", withExtension: "json")
        getJSONString(url: url!)
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Add 1 to # of posts because of the stories.
        return posts.count + 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "storiesCell", for: indexPath)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostViewCell
            cell.delegate = self
            let postRef = posts[indexPath.row-1] //Subtract one because of stories
            
            //TODO
            
            cell.setOutlets(profileImage: postRef.userProfilePic, username: postRef.username, contentImage: UIImage(named: "Hero")!, caption: postRef.caption, imageURL: postRef.imageURL)
            
            return cell
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 93.5
        } else {
            return 485.0
        }
    }
    
    //MARK: - Post Cell delegate
    func willOpenProfile(named: String) {
        self.usernameToSend = named
        performSegue(withIdentifier: "showProfile", sender: self)
    }

    
    // MARK: - Navigation
     
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showProfile" {
            let dest = segue.destination as! ProfileViewController
            dest.ownProfile = false
            dest.username = usernameToSend
        }
    }
    
    //MARK: - JSON Handling functions
    func getJSONString(url: URL) {
        do {
            if let data = NSData(contentsOf: url),
            let json = try JSONSerialization.jsonObject(with: data as Data) as? [String: Any],
                let results = json["results"] as? [[String: Any]] {
                
                for result in results {
                    let newPost = Post(imageURL: URL(string: result["imageURL"] as! String)!, caption: result["caption"] as! String, username: result["username"] as! String, userProfilePic: URL(string: result["userProfilePic"] as! String)!)
                    self.posts.append(newPost)
                }
            }
            
            
        } catch {
            print("ERROR")
        }
        
        self.tableView.reloadData()
    }
    

}

protocol PostCellDelegate {
    func willOpenProfile(named: String)
}
