//
//  TableViewController.swift
//  CookinReader
//
//  Created by Mir Ahmed on 7/24/17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit

enum RecipeViewMode {
    case viewMode
    case editMode(isNewRecipe: Bool)
}

class RecipeViewController: UITableViewController {
    
    var recipe: Recipe!
    var mode: RecipeViewMode!
    
    private enum RecipeSection: Int {
        case ingredients
        case steps
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // show header based on recipe
        if recipe != nil {
            setupTableView()
        }
        else {
            setupEmptyTableView()
            
            var emptyIngredients: [String] = [String]()
            var emptySteps: [String] = [String]()
            
            recipe.ingredients = emptyIngredients
            recipe.steps = emptySteps
            mode = RecipeViewMode.editMode(isNewRecipe: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            
            cell.ingredientsTextView?.text = recipe.ingredients[indexPath.row]
            return cell
            
        case .steps:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "recipeStepsCell", for: indexPath) as? RecipeStepsCell else {
                fatalError()
            }
            
            cell.stepsTextView?.text = recipe.steps[indexPath.row]
            return cell

        }
    }
    
// ----------------------------------------------------------------------------------------------------------------------
// CREATE HEADERS FOR SCREEN AND SECTIONS
    
    // create tableView methods
    private func setupTableView() {
        // create frame
        let screenWidth = UIScreen.main.bounds.width
        let frame = CGRect(x: 0, y: 0, width: screenWidth, height: 300)
        
        // create instance of RecipeHeaderView to set up table header
        let headerView = RecipeHeaderView(frame: frame)
        headerView.recipeImage.image = recipe.imageRef
        headerView.recipeName.text = recipe.name
        
        tableView.tableHeaderView = headerView
    }
    
    private func setupEmptyTableView() {
        // create frame
        let screenWidth = UIScreen.main.bounds.width
        let frame = CGRect(x: 0, y: 0, width: screenWidth, height: 300)
        
        // create instance of AddRecipeHeaderView to set up table header
        let headerView = AddRecipeHeaderView(frame: frame)
        
        tableView.tableHeaderView = headerView
    }
    
    // create headers for section views
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let screenWidth = UIScreen.main.bounds.width
        
        guard let recipeSection = RecipeSection(rawValue: section) else {
            fatalError()
        }
        
        switch recipeSection {
            
        case .ingredients:
            let frame = CGRect(x: 0, y: 0, width: screenWidth, height: 100)
            let sectionView = IngredientsSectionHeaderView(frame: frame)
            sectionView.ingredientsHeaderLabel.text = "   Ingredients"
            return sectionView
            
        case .steps:
            let frame = CGRect(x: 0, y: 0, width: screenWidth, height: 100)
            let sectionView = StepsSectionHeaderView(frame: frame)
            sectionView.stepsHeaderLabel.text = "   Steps"
            return sectionView
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(50)
    }
}
