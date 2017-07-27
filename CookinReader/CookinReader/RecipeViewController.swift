//
//  TableViewController.swift
//  CookinReader
//
//  Created by Mir Ahmed on 7/24/17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit

class RecipeViewController: UITableViewController {
    
    var recipe: Recipe!
    
    private enum RecipeSection: Int {
        case ingredients
        case steps
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // create tableView methods
    private func setupTableView() {
        // create frame 
        let frame = CGRect(x: 0, y: 0, width: 375, height: 300)
        
        // create instance of RecipeHeaderView
        let headerView = RecipeHeaderView(frame: frame)
        headerView.recipeImage.image = #imageLiteral(resourceName: "chickenQuesadilla")
        headerView.recipeName.text = "Quesadilla"
        headerView.recipeDescription.text = "Some Description"
        
        // set as header
        tableView.tableHeaderView = headerView
//        recipeList = FakeRecipeService.createFakeRecipes()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let recipeSection = RecipeSection(rawValue: section) else {
            fatalError()
        }
        
        switch recipeSection {
        
        case .ingredients:
            return recipe.ingredients.count
        
        case .steps:
            return recipe.steps.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let recipeSection = RecipeSection(rawValue: indexPath.section) else {
            fatalError()
        }
        
        switch recipeSection {
            
        case .ingredients:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "recipeIngredientsCell", for: indexPath) as? RecipeIngredientsCell else {
                fatalError()
            }
            
            cell.ingredientsLabel?.text = recipe.ingredients[indexPath.row]
            return cell
            
        case .steps:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "recipeStepsCell", for: indexPath) as? RecipeStepsCell else {
                fatalError()
            }
            
            cell.stepsLabel?.text = recipe.steps[indexPath.row]
            return cell

        }
    }
    
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        if section == 1 {
//            return recipe.ingredients.count
//        } else {
//            
//        }
//        
//        
//        
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//    }
//    
}
