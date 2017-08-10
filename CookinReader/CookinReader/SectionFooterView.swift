//
//  SectionFooterView.swift
//  CookinReader
//
//  Created by Mir Ahmed on 8/2/17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit

protocol SectionFooterViewDelegate:class {
    func willAddItemFor(section: RecipeSection)
}

class SectionFooterView: UIButton, NibLoading {
    @IBOutlet weak var addButton: UIButton!
    
    weak var delegate: SectionFooterViewDelegate!
    
    var section: RecipeSection!
    
    // MARK: - Initializers
    
    @IBAction func plusButtonWasPressed(sender: UIButton) {
        delegate.willAddItemFor(section: section)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
}
