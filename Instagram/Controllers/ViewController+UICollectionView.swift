//
//  ViewController+UICollectionView.swift
//  Instagram
//
//  Created by Philippe Yu on 2017-12-12.
//  Copyright © 2017 Philippe Yu. All rights reserved.
//

import UIKit

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storiesCell", for: indexPath) as! StoriesCollectionViewCell
        
        return cell
    }
}
