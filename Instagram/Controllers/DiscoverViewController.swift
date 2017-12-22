//
//  DiscoverViewController.swift
//  Instagram
//
//  Created by Philippe Yu on 2017-10-21.
//  Copyright © 2017 Philippe Yu. All rights reserved.
//

import UIKit

class DiscoverViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 20
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCell
        cell.contentImageView.image = UIImage(named: "Club")
    
        // Configure the cell
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "seePost", sender: self)
    }
    
    //MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //Get the screen bounds, then the width
        let screen = UIScreen.main.bounds
        let screenWidth: CGFloat = screen.width
        //Make the cell width ~1/3 of the screen.
        let cellWidth = screenWidth / 3.02
        
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "seePost" {
            let dest = segue.destination as! AdditionalDetailsViewController
            dest.post = Post(imageURL: URL(string: "http://img2.wikia.nocookie.net/__cb20140416021517/simpsons/images/5/5e/Snrub.jpg")!, caption: "Wow, so good", username: "SomeoneCalledPhilippe", userProfilePic: URL(string: "https://asheathersworldturns.files.wordpress.com/2014/08/waylon.jpg")!)
        }
    }

}
