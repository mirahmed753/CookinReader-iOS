//
//  Recipe.swift
//  CookinReader
//
//  Created by Mir Ahmed on 7/24/17.
//  Copyright © 2017 None. All rights reserved.
//

import Foundation

class Recipe {
    var name: String
    var imageRef: String
    var ingredients: [String]
    var steps: [String]
    
    init(name: String, imageRef: String, ingredients: [String], steps: [String]) {
        self.name = name
        self.imageRef = imageRef
        self.ingredients = ingredients
        self.steps = steps 
    }
}
