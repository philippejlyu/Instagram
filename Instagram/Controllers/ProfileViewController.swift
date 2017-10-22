//
//  ProfileViewController.swift
//  Instagram
//
//  Created by Philippe Yu on 2017-10-22.
//  Copyright © 2017 Philippe Yu. All rights reserved.
//

import UIKit

class ProfileViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    //MARK: - Properties
    var ownProfile = true
    var username = "someonecalledphilippe"
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = username
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    /*
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
     */

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 20
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            //Profile summary
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "infoCell", for: indexPath) as! ProfileCell
            cell.descriptionLabel.text = "Loreum Ipsum dor sit amet"
            cell.followerNumberLabel.text = "62"
            cell.followingNumberLabel.text = "158"
            cell.postNumberLabel.text = "260"
            cell.realNameLabel.text = "Philippe Yu"
            cell.setUI(ownProfile: ownProfile)
            return cell
        } else {
            //Do the photos
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCell
            cell.contentImageView.image = UIImage(named: "Club")
            return cell
        }
        
    }
    
    //MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //Get the screen bounds, then the width
        let screen = UIScreen.main.bounds
        let screenWidth: CGFloat = screen.width
        
        if indexPath.row == 0 {
            //Only do this if it is the information cell
            return CGSize(width: screenWidth, height: 170.0)
        } else {
            //Only do this if it is the image
            //Make the cell width ~1/3 of the screen.
            let cellWidth = screenWidth / 3.02
            
            return CGSize(width: cellWidth, height: cellWidth)
        }
        
        
    }
    
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}