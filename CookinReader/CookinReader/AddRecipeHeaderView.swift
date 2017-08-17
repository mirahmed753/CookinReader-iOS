//
//  AddRecipeHeaderView.swift
//  CookinReader
//
//  Created by Mir Ahmed on 8/1/17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit

protocol AddRecipeHeaderViewDelegate:class {
    func getRecipeName(recipeName: String)
    func setRecipeImage() 
}

class AddRecipeHeaderView: UIView, UIImagePickerControllerDelegate, NibLoading, UITextFieldDelegate {
    @IBOutlet weak var recipeNameTextField: UITextField!
    @IBOutlet weak var addRecipeImageButton: UIButton!
    
    weak var delegate: AddRecipeHeaderViewDelegate!
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let recipeName = textField.text else { return }
        delegate.getRecipeName(recipeName: recipeName)
    }
    
    @IBAction func addImageButtonPressed(_ sender: UIButton) {
        delegate.setRecipeImage()
    }
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        //setupImageInButton()
    }
    
//    private func setupImageInButton() {
//        addRecipeImageButton.imageView?.image = #imageLiteral(resourceName: "addIcon")
//        addRecipeImageButton.layer.cornerRadius = 35
//    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
}
