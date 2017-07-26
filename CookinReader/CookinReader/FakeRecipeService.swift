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
        
        let recipe1 = Recipe(name: "Chicken Quesadilla", imageRef: "someRef", ingredients: ingredients1, steps: steps1);
        recipeList.append(recipe1)
        return recipeList
    }
}
