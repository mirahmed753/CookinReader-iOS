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
        let screenWidth = UIScreen.main.bounds.width
        let frame = CGRect(x: 0, y: 0, width: screenWidth, height: 300)
        
        // create instance of RecipeHeaderView to set up table header
        let headerView = RecipeHeaderView(frame: frame)
        headerView.recipeImage.image = recipe.imageRef
        headerView.recipeName.text = recipe.name
        headerView.recipeDescription.text = "Some Description"
        
        tableView.tableHeaderView = headerView
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
