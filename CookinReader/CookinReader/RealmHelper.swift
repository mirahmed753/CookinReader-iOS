//
//  RealmHelper.swift
//  CookinReader
//
//  Created by Mir Ahmed on 8/10/17.
//  Copyright © 2017 None. All rights reserved.
//

import RealmSwift

class RealmHelper {
    
    // add recipe
    static func addRecipe(recipe: Recipe) {
        let realm = try! Realm()
        try! realm.write() {
            realm.add(recipe)
        }
    }
    
    // modify recipe name
    static func modifyRecipeName(recipe: Recipe, newName: String) {
        let realm = try! Realm()
        
        try! realm.write {
            recipe.name = newName
        }
    }
    
    // add ingredient
    static func addIngredient(recipe: Recipe, newIngredient: Ingredient) {
        let realm = try! Realm()
        
        try! realm.write {
            recipe.ingredients.append(newIngredient)
        }
    }
    
    // add step
    static func addStep(recipe: Recipe, newStep: Step) {
        let realm = try! Realm()
        
        try! realm.write {
            recipe.steps.append(newStep)
        }
    }
    
    // retrieve all recipes
    static func retrieveRecipes() -> Results<Recipe> {
        let realm = try! Realm()
        return realm.objects(Recipe) //.sorted("modificationTime", ascending: false)
    }
}
