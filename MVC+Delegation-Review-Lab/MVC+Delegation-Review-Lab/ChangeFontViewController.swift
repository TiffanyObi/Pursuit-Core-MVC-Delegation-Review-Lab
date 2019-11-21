//
//  ChangeFontViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Tiffany Obi on 11/20/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ChangeFontViewController: UIViewController {
    @IBOutlet weak var fontSizeSlider: UISlider!
    @IBOutlet weak var fontSizeStepper: UIStepper!
    @IBOutlet weak var previewLabel: UILabel!
    
    var eachMovie: Movie?
    
    var stepperValue: Double = 0.0
    var sliderValue: Float = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepperValue = Double(sliderValue)
        
        configureSlider()
        configureStepper()
      
    }
    
    func configureStepper() {
        fontSizeStepper.minimumValue = 10.0
        fontSizeStepper.maximumValue = 30.0
       fontSizeStepper.stepValue = 1.0
        
        //default start value
        fontSizeStepper.value = Double(sliderValue)
    }
    func configureSlider() {
        fontSizeSlider.minimumValue = 10
        fontSizeSlider.maximumValue = 30
        fontSizeSlider.value = sliderValue
    }
    
    @IBAction func stepperChanged(sender: UIStepper){
       
        stepperValue = sender.value
        sliderValue = Float(stepperValue)
        fontSizeSlider.value = Float(stepperValue)
        previewLabel.text = "Preview Font Size: \(String(format: "%0.f",sender.value))"
    }
    
    @IBAction func sliderChanged(sender: UISlider){
        
        sliderValue = sender.value
        stepperValue = Double(sliderValue)
        fontSizeStepper.value = Double(sliderValue)
        previewLabel.text = "Preview Font Size: \(String(format: "%0.f",sender.value))"
    }
    
        }
        
    
    

