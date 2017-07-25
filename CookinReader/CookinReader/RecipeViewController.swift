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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    private func setupTableView() {
        // create frame 
        let frame = CGRect(x: 0, y: 0, width: 375, height: 300)
        
        // create instance of RecipeHeaderView
        let headerView = RecipeHeaderView(frame: frame)
        headerView.recipeName.text = "Pasta"
        headerView.recipeDescription.text = "A noodle made from an unleavened dough of a durum wheat flour mixed with water or eggs"
        
        // set as header
        tableView.tableHeaderView = headerView
    }
}
