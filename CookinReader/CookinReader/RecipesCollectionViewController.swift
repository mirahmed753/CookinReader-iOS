//
//  RecipesCollectionViewController.swift
//  CookinReader
//
//  Created by Mir Ahmed on 7/25/17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit

class RecipesCollectionViewController: UICollectionViewController {
    
    private enum RecipeSegue: String {
        case addRecipe
        case displayRecipe
    }
    
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
//        cell.recipeImageView.layer.cornerRadius = 20
//        cell.recipeImageView.clipsToBounds = true
        
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
                nextVC.recipe = selectedRecipe!
            }
            else if identifier == "addRecipe"
            {
                print("+ button tapped")
                nextVC.mode = RecipeViewMode.editMode(isNewRecipe: true)
            }
        }
    }
}





//
//override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    super.prepare(for: segue, sender: self)
//    
//    guard let nextVC = segue.destination as? RecipeViewController
//        //            ,
//        //              let identifierString = segue.identifier,
//        //              let recipeSegue = RecipeSegue(rawValue: identifierString)
//        else {
//            return
//    }
//    
//    //        nextVC.recipe = selectedRecipe!
//    //        nextVC.recipe.ingredients = (selectedRecipe?.ingredients)!
//    
//    if let identifier = segue.identifier {
//        if identifier == "displayRecipe" {
//            print("Table view cell tapped")
//            
//            //                // 1
//            //                let indexPath = tableView.indexPathForSelectedRow!
//            //                // 2
//            //                let note = notes[indexPath.row]
//            //                // 3
//            //                let displayNoteViewController = segue.destination as! DisplayNoteViewController
//            //                // 4
//            //                displayNoteViewController.note = note
//            
//        } else if identifier == "addRecipe" {
//            print("+ button tapped")
//        }
//    }
//    
//    
//    //        switch recipeSegue {
//    //
//    //        case .addRecipe:
//    //            nextVC.mode = RecipeViewMode.editMode(isNewRecipe: true)
//    //            nextVC.recipe = selectedRecipe!
//    //            nextVC.recipe.ingredients = (selectedRecipe?.ingredients)!
//    //
//    //        case .editRecipe:
//    //            nextVC.recipe = selectedRecipe!
//    //            nextVC.recipe.ingredients = (selectedRecipe?.ingredients)!
//    //
//    //        default:
//    //            nextVC.recipe = selectedRecipe!
//    //            nextVC.recipe.ingredients = (selectedRecipe?.ingredients)!
//    //        }
//    //        
//    //        //nextVC.recipe.ingredients = (selectedRecipe?.ingredients)!
//}
//}












