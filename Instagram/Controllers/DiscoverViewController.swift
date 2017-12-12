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
    
    //MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //Get the screen bounds, then the width
        let screen = UIScreen.main.bounds
        let screenWidth: CGFloat = screen.width
        //Make the cell width ~1/3 of the screen.
        let cellWidth = screenWidth / 3.02
        
        return CGSize(width: cellWidth, height: cellWidth)
    }

}
