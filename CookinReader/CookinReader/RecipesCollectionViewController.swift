//
//  RecipesCollectionViewController.swift
//  CookinReader
//
//  Created by Mir Ahmed on 7/25/17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit

class RecipesCollectionViewController: UICollectionViewController {
    var recipes: [Recipe]!
    
    override func collectionView(collectionView: UICollectionView!,
                                 cellForItemAtIndexPath indexPath: NSIndexPath!) ->
        UICollectionViewCell! {
            
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as CollectionViewCell
            
            // Configure the cell
            cell.backgroundColor = UIColor.blackColor()
            cell.textLabel?.text = "\(indexPath.section):\(indexPath.row)"
            cell.imageView?.image = UIImage(named: "circle")
            
            
            
            return cell
    }
}
