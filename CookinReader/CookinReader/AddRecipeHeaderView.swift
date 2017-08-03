//
//  AddRecipeHeaderView.swift
//  CookinReader
//
//  Created by Mir Ahmed on 8/1/17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit

class AddRecipeHeaderView: UIView, UIImagePickerControllerDelegate, NibLoading {
    @IBOutlet weak var recipeNameTextField: UITextField!
    
    
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
