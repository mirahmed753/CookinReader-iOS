//
//  Recipe.swift
//  CookinReader
//
//  Created by Mir Ahmed on 8/10/17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit
import RealmSwift

class Ingredient: Object {
    dynamic var ingredient = ""
    
    convenience init(ingredient: String) {
        self.init()
        self.ingredient = ingredient
    }
}

class Step: Object {
    dynamic var step = ""
    
    convenience init(step: String) {
        self.init()
        self.step = step
    }
}

class Recipe: Object {
    dynamic var name: String = ""
    dynamic var uniqueID: String = ""
    let ingredients = List<Ingredient>()
    let steps = List<Step>()
    
    convenience init(name: String) {
        self.init()
        self.name = name
        self.uniqueID = UUID().uuidString
    }
    
}
