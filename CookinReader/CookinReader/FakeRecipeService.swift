//
//  FakeRecipeService.swift
//  CookinReader
//
//  Created by Mir Ahmed on 7/25/17.
//  Copyright © 2017 None. All rights reserved.
//

import Foundation

class FakeRecipeService {
    class func createFakeRecipes() -> [Recipe] {
        var recipeList: [Recipe] = [Recipe]()
        
        let recipe1 = Recipe(name: "Pasta", imageRef: "pastaImage");
        recipeList.append(recipe1)
        
        let recipe2 = Recipe(name: "Grilled Chicken", imageRef: "chickenImage")
        recipeList.append(recipe2)
        
        let recipe3 = Recipe(name: "Brown Rice", imageRef: "riceImage")
        recipeList.append(recipe3)
        
        return recipeList
    }
}
