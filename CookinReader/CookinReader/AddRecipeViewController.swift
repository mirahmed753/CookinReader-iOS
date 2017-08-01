//
//  AddRecipeViewController.swift
//  CookinReader
//
//  Created by Mir Ahmed on 8/1/17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit

class AddRecipeViewController: UITableViewController {
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
        let headerView = AddRecipeHeaderView(frame: frame)
        
        tableView.tableHeaderView = headerView
    }
}
