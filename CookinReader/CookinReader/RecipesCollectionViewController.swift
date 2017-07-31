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
    
    // set the image
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipeCell", for: indexPath) as! RecipeCell
        
        //cell.recipeImageView.image = #imageLiteral(resourceName: "chickenQuesadilla")
        cell.recipeImageView.image = recipes[indexPath.item].imageRef
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedRecipe = recipes[indexPath.row]
        performSegue(withIdentifier: "EditRecipe", sender: self)
    }
    
    // prepare data for next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: self)
        
        guard let nextVC = segue.destination as? RecipeViewController else {
            return
        }
        
        nextVC.recipe = selectedRecipe!
        nextVC.recipe.ingredients = (selectedRecipe?.ingredients)!
    }
}



















