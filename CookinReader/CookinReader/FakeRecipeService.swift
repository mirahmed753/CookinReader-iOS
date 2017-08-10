//
//  FakeRecipeService.swift
//  CookinReader
//
//  Created by Mir Ahmed on 7/25/17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit

class FakeRecipeService {
    static var recipeList: [Recipe] = [Recipe]()
    
    class func createFakeRecipes() -> [Recipe] {
        var ingredients1: [String] = [String]()
        ingredients1.append("Tortilla")
        ingredients1.append("Chicken")
        
        var steps1: [String] = [String]()
        steps1.append("Cut the Chicken into strips")
        steps1.append("Put the Chicken into the Tortilla")
        
        let recipe1 = Recipe(name: "Chicken Quesadilla", imageRef: #imageLiteral(resourceName: "chickenQuesadilla"), ingredients: ingredients1, steps: steps1)
        recipeList.append(recipe1)
        
        var ingredients2: [String] = [String]()
        ingredients2.append("Rice")
        ingredients2.append("Chicken")
        ingredients2.append("Potatos")
        
        var steps2: [String] = [String]()
        steps2.append("Cut the chicken and potatoes and throw them in the pot!")
        steps2.append("Put the rick in the pot!")
        steps2.append("Cook it up b!")
        
        let recipe2 = Recipe(name: "Rice and Chicken", imageRef: #imageLiteral(resourceName: "riceAndChicken"), ingredients: ingredients2, steps: steps2)
        recipeList.append(recipe2) 
        
        return recipeList
    }
}
