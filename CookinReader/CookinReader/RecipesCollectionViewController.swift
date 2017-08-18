//
//  RecipesCollectionViewController.swift
//  CookinReader
//
//  Created by Mir Ahmed on 7/25/17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit
import RealmSwift

class RecipesCollectionViewController: UICollectionViewController {

    var recipes: Results<Recipe>! {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    // get all the recipes and display in collection view
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        recipes = RealmHelper.retrieveRecipes()
    }
    
    // create variable to maneuver selected recipe in collection view
    var selectedRecipe: Recipe?
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    // set contents of collection cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipeCell", for: indexPath) as! RecipeCell
        
        let recipe = recipes[indexPath.item]
        
        // set the recipe's name
        cell.recipeName.text = recipe.name
        
        // set the recipe's image
        if let recipeImage = RecipePhotoHelper.loadPhotoFor(recipe: recipe) {
            cell.recipeImageView.image = recipeImage
        } else {
            cell.recipeImageView.image = #imageLiteral(resourceName: "addIcon")
        }
        
        return cell
    }
    
    // delete recipe
    
    
    // segue perform method
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
                nextVC.recipe = selectedRecipe!
            }
            else if identifier == "addRecipe"
            {
                print("+ button tapped")
                
                //let emptyRecipe = Recipe(name: "", imageRef: #imageLiteral(resourceName: "cameraIcon"))
                let emptyRecipe = Recipe(name: "")
                nextVC.recipe = emptyRecipe
                RealmHelper.addRecipe(recipe: emptyRecipe)
            }
        }
    }
}
