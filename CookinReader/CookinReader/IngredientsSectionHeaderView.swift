//
//  IngredientsSectionHeaderView.swift
//  CookinReader
//
//  Created by Mir Ahmed on 7/28/17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit

protocol IngredientsSectionHeaderViewDelegate:class {
    func readIngredient(recipe: Recipe)
}

class IngredientsSectionHeaderView: UILabel, NibLoading {
    @IBOutlet weak var ingredientsHeaderLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    weak var delegate: IngredientsSectionHeaderViewDelegate!
    var recipe: Recipe!
    
    
    @IBAction func playButtonWasPressed(_ sender: UIButton) {
        delegate.readIngredient(recipe: recipe)
    }
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
}
