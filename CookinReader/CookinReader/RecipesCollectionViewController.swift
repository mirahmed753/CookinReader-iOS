//
//  RecipesCollectionViewController.swift
//  CookinReader
//
//  Created by Mir Ahmed on 7/25/17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit

class RecipesCollectionViewController: UICollectionViewController {
    
    var recipes: [Recipe] = FakeRecipeService.createFakeRecipes()
    var selectedRecipe: Recipe?
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipeCell", for: indexPath) as! RecipeCell
        
        cell.recipeImageView.image = #imageLiteral(resourceName: "chickenQuesadilla")
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedRecipe = recipes[indexPath.row]
        performSegue(withIdentifier: "EditRecipe", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: self)
        
        guard let nextVC = segue.destination as? RecipeViewController else {
            return
        }
        
        nextVC.recipe = selectedRecipe!
    }
    
}
