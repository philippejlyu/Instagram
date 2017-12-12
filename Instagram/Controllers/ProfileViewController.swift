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
        self.navigationItem.title = username
    }
    
    //MARK: - Collection View data source
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
}
