//
//  ViewController.swift
//  Instagram
//
//  Created by Philippe Yu on 2017-10-20.
//  Copyright © 2017 Philippe Yu. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, PostCellDelegate {
    
    //MARK: - Properties
    var usernameToSend = ""
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "storiesCell", for: indexPath)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostViewCell
            cell.delegate = self
            cell.setOutlets(profileImage: UIImage(named: "Club")!, username: "BMSSProgramming", contentImage: UIImage(named: "Hero")!, caption: "Join the programming club")
            
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
    

}

protocol PostCellDelegate {
    func willOpenProfile(named: String)
}
