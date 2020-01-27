//
//  ChangeFontViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Tiffany Obi on 11/20/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit
// note that AnyObject is a class. the paremeters can be "anything" thing tho. int,string etc
protocol FontChangeDelegate: AnyObject {
    func fontSizeValueDidChange(_ fontSizeController: ChangeFontViewController, fontSize: Float)
}

class ChangeFontViewController: UIViewController {
    @IBOutlet weak var fontSizeSlider: UISlider!
    @IBOutlet weak var fontSizeStepper: UIStepper!
    @IBOutlet weak var previewLabel: UILabel!
    
    var eachMovie: Movie?
    
    var fontSize: Float = 0.0 {
        didSet {
            fontSizeDelegate?.fontSizeValueDidChange(self, fontSize: fontSize)
        }
    }
    
    weak var fontSizeDelegate: FontChangeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        fontSize = fontSize
        configureSlider()
        configureStepper()
      
    }
    
    func configureStepper() {
        fontSizeStepper.minimumValue = 10.0
        fontSizeStepper.maximumValue = 30.0
       fontSizeStepper.stepValue = 1.0
        
        //default start value
        fontSizeStepper.value = Double(fontSize)
        
    }
    func configureSlider() {
        fontSizeSlider.minimumValue = 10
        fontSizeSlider.maximumValue = 30
        fontSizeSlider.value = fontSize
    }
    
    
    
    @IBAction func stepperChanged(sender: UIStepper){
       
        fontSize = Float(sender.value)
        
        fontSizeSlider.value = Float(fontSize)
        previewLabel.text = "Preview Font Size: \(String(format: "%0.f",sender.value))"
    }
    
    @IBAction func sliderChanged(sender: UISlider){
        
        fontSize = sender.value

        fontSizeStepper.value = Double(fontSize)
        previewLabel.text = "Preview Font Size: \(String(format: "%0.f",sender.value))"
    }
    
  
    
}

    
    

