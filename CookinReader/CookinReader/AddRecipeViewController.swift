//
//  AddRecipeViewController.swift
//  CookinReader
//
//  Created by Mir Ahmed on 8/1/17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit

enum RecipeSection: Int {
    case ingredients
    case steps
}

class AddRecipeViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
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
    
    // create footers for section views
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

extension AddRecipeViewController: SectionFooterViewDelegate {
    
    func willAddItemFor(section: RecipeSection) {
        
    }
}
