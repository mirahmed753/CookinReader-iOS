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
    
    var recipeList: [Recipe] = [Recipe]()
    

    @IBOutlet var ingredientsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setupTableView()
    }
    
//    private func setupTableView() {
////        // create frame 
////        let frame = CGRect(x: 0, y: 0, width: 375, height: 300)
////        
////        // create instance of RecipeHeaderView
////        let headerView = RecipeHeaderView(frame: frame)
////        headerView.recipeName.text = "Pasta"
////        headerView.recipeDescription.text = "A noodle made from an unleavened dough of a durum wheat flour mixed with water or eggs"
////        
////        // set as header
////        tableView.tableHeaderView = headerView
//        recipeList = FakeRecipeService.createFakeRecipes()
//        
//        ingredientsLabel.text = recipeList[0].ingredients[0]
//    }
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
