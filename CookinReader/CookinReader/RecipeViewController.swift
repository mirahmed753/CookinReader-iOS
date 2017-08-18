//
//  TableViewController.swift
//  CookinReader
//
//  Created by Mir Ahmed on 7/24/17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit
import RealmSwift
import AVFoundation

enum RecipeSection: Int {
    case ingredients
    case steps
}

class RecipeViewController: UITableViewController {
    
    // variable recipe is the one chosen from the collection cell
    var recipe: Recipe!
    let photoHelper = RecipePhotoHelper()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        setupTableView()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // based on the section title, return the number of elements in that section
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
    
    // set the contents of the section's cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let recipeSection = RecipeSection(rawValue: indexPath.section) else {
            fatalError()
        }
        
        switch recipeSection {
            
        case .ingredients:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "recipeIngredientsCell", for: indexPath) as? RecipeIngredientsCell else {
                fatalError()
            }
            
            cell.ingredientsTextView?.text = recipe.ingredients[indexPath.row].ingredient
            return cell
            
        case .steps:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "recipeStepsCell", for: indexPath) as? RecipeStepsCell else {
                fatalError()
            }
            
            cell.stepsTextView?.text = recipe.steps[indexPath.row].step
            return cell
            
        }
    }
    
    // present user with an alert to type their desired ingredient/step
    fileprivate func alertController(for section: RecipeSection) -> UIAlertController {
        
        var title = "Add your "
        
        switch  section {
        case .ingredients:
            title += "ingredient"
            
        case .steps:
            title += "step"
        }
        
        let alertController = UIAlertController(title: title,
                                                message: nil,
                                                preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            
            switch section {
                
            case .ingredients:
                textField.placeholder = "Ingredient Name"
                
            case .steps:
                textField.placeholder = "Step Name"
                
            }
            
        }
        
        let okAction = UIAlertAction(title: "OK",
                                     style: .default) { (action) in
                                        
            let text = alertController.textFields?[0].text
                                        
            switch section
            {
                
                case .ingredients:
                    let ingredient = Ingredient(ingredient: text!)
                    RealmHelper.addIngredient(recipe: self.recipe, newIngredient: ingredient)
                
                                    
                case .steps:
                    let step = Step(step: text!)
                    RealmHelper.addStep(recipe: self.recipe, newStep: step)
            }
            self.tableView.reloadData()
                    
        }
        
        alertController.addAction(okAction)
        return alertController
    }
    
    // prepare function: add the recipe to the list of recipes
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let recipeCollectionViewController = segue.destination as! RecipesCollectionViewController
        
        RealmHelper.addRecipe(recipe: recipe)
        recipeCollectionViewController.recipes = RealmHelper.retrieveRecipes()
    }
    
    // deletion
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            guard let recipeSection = RecipeSection(rawValue: indexPath.section) else {
                fatalError()
            }
            
            switch recipeSection
            {
            case .ingredients:
                RealmHelper.deleteIngredient(recipe: recipe, ingredient: recipe.ingredients[indexPath.row], ingredientDeletionRow: indexPath.row)
                
            case .steps:
                RealmHelper.deleteStep(recipe: recipe, step: recipe.steps[indexPath.row], stepDeletionRow: indexPath.row)
            }
            tableView.reloadData()
        }
    }
    
    // read the recipe
    @IBAction func readButtonPressed(_ sender: Any) {
        // create instance of AVSpeechSyntesizer
        let synthesizer = AVSpeechSynthesizer()
        
        var utterance   = AVSpeechUtterance(string: recipe.name)
        synthesizer.speak(utterance)
        
        // create speeches for Ingredients section
        utterance = AVSpeechUtterance(string: "Ingredients")
        synthesizer.speak(utterance)
        
        var count = recipe.ingredients.count
        if(count == 0) {
            utterance = AVSpeechUtterance(string: "No Ingredients Listed")
            synthesizer.speak(utterance)
        }
        
        for i in 0..<count {
            let ingredientNum = "Ingredient \(i+1)"
            
            utterance = AVSpeechUtterance(string: ingredientNum)
            synthesizer.speak(utterance)
            
            utterance = AVSpeechUtterance(string: recipe.ingredients[i].ingredient)
            synthesizer.speak(utterance)
        }
        
        
        // create speeches for Steps section
        utterance = AVSpeechUtterance(string: "Steps")
        synthesizer.speak(utterance)
        
        count = recipe.steps.count
        if(count == 0) {
            utterance = AVSpeechUtterance(string: "No Steps Listed")
            synthesizer.speak(utterance)
        }
        
        for i in 0..<count {
            let stepNum = "Step \(i+1)"
            
            utterance = AVSpeechUtterance(string: stepNum)
            synthesizer.speak(utterance)
            
            utterance = AVSpeechUtterance(string: recipe.steps[i].step)
            synthesizer.speak(utterance)
        }
    }
    
    // ----------------------------------------------------------------------------------------------------------------------
    // CREATE HEADERS FOR SCREEN AND SECTIONS
    
    // create tableView methods
    private func setupTableView() {
        // create frame
        let screenWidth = UIScreen.main.bounds.width
        let frame = CGRect(x: 0, y: 0, width: screenWidth, height: 300)
        
        // create instance of AddRecipeHeaderView to set up table header
        let headerView = AddRecipeHeaderView(frame: frame)
        
        photoHelper.completionHandler = { image in
            print("handle image")
        }
        
        headerView.delegate = self
        headerView.addRecipeImageButton.setImage(RecipePhotoHelper.loadPhotoFor(recipe: recipe), for: .normal)
        headerView.recipeNameTextField.text = recipe.name
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
            return sectionView
            
        case .steps:
            let frame = CGRect(x: 0, y: 0, width: screenWidth, height: 100)
            let sectionView = StepsSectionHeaderView(frame: frame)
            return sectionView
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(41)
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let screenWidth = UIScreen.main.bounds.width
        
        guard let recipeSection = RecipeSection(rawValue: section) else {
            fatalError()
        }
        
        let frame = CGRect(x: 0, y: 0, width: screenWidth, height: 100)
        let sectionView = SectionFooterView(frame: frame)
        sectionView.section = recipeSection
        sectionView.delegate = self
        return sectionView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat(50)
    }
}

extension RecipeViewController: SectionFooterViewDelegate {
    func willAddItemFor(section: RecipeSection) {
        let alert = alertController(for: section)
        present(alert, animated: true, completion: nil)
    }
}

extension RecipeViewController: AddRecipeHeaderViewDelegate {
    func getRecipeName(recipeName: String) {
        RealmHelper.modifyRecipeName(recipe: recipe, newName: recipeName)
    }
    
    func setRecipeImage() {
        
        photoHelper.presentActionSheet(from: self) { [unowned self] (image) in
            RecipePhotoHelper.savePhotoFor(recipe: self.recipe, photo: image)
        }
        
        print("add image button tapped")
    }
}
