//
//  StepsSectionHeaderView.swift
//  CookinReader
//
//  Created by Mir Ahmed on 7/28/17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit

protocol StepsSectionHeaderViewDelegate:class {
    func readStep(recipe: Recipe)
}

class StepsSectionHeaderView: UILabel, NibLoading {
    @IBOutlet weak var stepsHeaderLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    weak var delegate: StepsSectionHeaderViewDelegate!
    var recipe: Recipe!
    
    
    @IBAction func playButtonWasPressed(_ sender: UIButton) {
        delegate.readStep(recipe: recipe)
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
