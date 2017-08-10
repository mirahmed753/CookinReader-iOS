//
//  IngredientsSectionHeaderView.swift
//  CookinReader
//
//  Created by Mir Ahmed on 7/28/17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit

class IngredientsSectionHeaderView: UILabel, NibLoading {
    @IBOutlet weak var ingredientsHeaderLabel: UILabel!
    
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
