//
//  RecipesCollectionViewController.swift
//  CookinReader
//
//  Created by Mir Ahmed on 7/25/17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit

class RecipesCollectionViewController: UICollectionViewController {
    
//    private enum RecipeSegue: String {
//        case addRecipe
//        case displayRecipe
//    }
    
    var recipes = [Recipe]() {
        didSet {
            collectionView?.reloadData()
        }
    }
    
//    var recipes: [Recipe] = FakeRecipeService.createFakeRecipes()
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
        
        let recipe = recipes[indexPath.item]
        
        if let recipeImage = recipe.imageRef {
            cell.recipeImageView.image = recipeImage
        } else {
            cell.recipeImageView.image = #imageLiteral(resourceName: "cameraIcon")
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedRecipe = recipes[indexPath.row]
        performSegue(withIdentifier: "displayRecipe", sender: self)
    }
    
    // prepare data for next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: self)
        
        guard let nextVC = segue.destination as? RecipeViewController
        else {
            return
        }
        
        // present screen based on the identifier name
        if let identifier = segue.identifier
        {
            if identifier == "displayRecipe"
            {
                print("Collection view cell tapped")
                //nextVC.mode = RecipeViewMode.editMode(isNewRecipe: false)
                nextVC.recipe = selectedRecipe!
            }
            else if identifier == "addRecipe"
            {
                print("+ button tapped")
                nextVC.mode = RecipeViewMode.editMode(isNewRecipe: true)
                
                let emptyIngredients: [String] = [String]()
                let emptySteps: [String] = [String]()
                let emptyRecipe = Recipe(name: "", imageRef: #imageLiteral(resourceName: "cameraIcon"), ingredients: emptyIngredients, steps: emptySteps)
                
                nextVC.recipe = emptyRecipe
            }
        }
    }
    
    // unwind segue 
    @IBAction func unwindToRecipesCollectionViewController(_ segue: UIStoryboardSegue) {
        
        // for now, simply defining the method is sufficient.
        // we'll add code later
        
    }
    
}
