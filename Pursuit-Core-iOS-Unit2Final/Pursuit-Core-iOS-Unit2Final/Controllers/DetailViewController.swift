//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Margiett Gil on 11/22/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: outlets and properties
    
    @IBOutlet weak var theColorView:UIView! //this is what going to make the background change color.
    @IBOutlet weak var crayonNameLabel: UILabel! // chosen color
    
    //MARK: Red slider and label outlets
    @IBOutlet weak var colorRedSlider: UISlider!
    @IBOutlet weak var colorRedLabel: UILabel!
    
    //MARK: Blue slider and label outlets
    @IBOutlet weak var colorBlueSlider: UISlider!
    @IBOutlet weak var colorBlueLabel: UILabel!
    
    //MARK: Green slider and label outlets
    @IBOutlet weak var colorGreenSlider: UISlider!
    @IBOutlet weak var colorGreenLabel: UILabel!
    
    //MARK: Alpha slider and label outlets
    @IBOutlet weak var colorAlphaStepper: UIStepper!
    @IBOutlet weak var colorAlphaLabel: UILabel!
    
    var colorDVC: Crayon?
    var colorRedCrayonDVC = Float()
    var colorGreenCrayonDVC = Float()
    var colorBlueCrayonDVC = Float()
    var alphaDVC: Float = 1.0

    
    override func viewDidLoad() {
        super.viewDidLoad()

guard let theColor = colorDVC else {
return
    
        }
       crayonNameLabel.text = theColor.name
       
       colorRedCrayonDVC = Float(theColor.red / 255)
        colorGreenCrayonDVC = Float(theColor.green / 255)
       colorBlueCrayonDVC = Float(theColor.blue / 255)
        
    theColorView.backgroundColor = UIColor(displayP3Red: CGFloat(theColor.red / 255), green: CGFloat(theColor.green / 255), blue: CGFloat(theColor.blue / 255), alpha: 1.0)
        
           colorRedLabel.text = "Red: " + String(format: "%.9f", (Double(theColor.red) / 255))
           colorGreenLabel.text = "Green: " + String(format: "%.9f", (Double(theColor.green) / 255))
           colorBlueLabel.text = "Blue: " + String(format: "%.9f", (Double(theColor.blue) / 255))
       
       
    }
        // should not have to have configure code since i did it on the storyboard
    
    @IBAction func colorRedSlider(_ sender: UISlider) {
        colorRedLabel.text = "Red: " + String(format: "%.9f", sender.value)
        theColorView.backgroundColor = UIColor(displayP3Red: CGFloat(sender.value), green: CGFloat(colorGreenCrayonDVC), blue: CGFloat(colorBlueCrayonDVC), alpha: CGFloat(alphaDVC))
        colorRedCrayonDVC = sender.value
    }
    
    @IBAction func colorBlueSlider(_ sender: UISlider) {
        colorBlueLabel.text = "Blue: " + String(format: "%.9f", sender.value)
             theColorView.backgroundColor = UIColor(displayP3Red: CGFloat(colorRedCrayonDVC), green: CGFloat(colorGreenCrayonDVC), blue: CGFloat(sender.value), alpha: CGFloat(alphaDVC))
             colorBlueCrayonDVC = sender.value
        
    }
    
    @IBAction func colorGreenSlider(_ sender: UISlider) {
     colorGreenLabel.text = "Green: " + String(format: "%.9f", sender.value)
        theColorView.backgroundColor = UIColor(displayP3Red: CGFloat(colorRedCrayonDVC), green: CGFloat(sender.value), blue: CGFloat(colorBlueCrayonDVC), alpha: CGFloat(alphaDVC))
         colorGreenCrayonDVC = sender.value
    
    }
    
    @IBAction func colorAlphaStepper(_ sender: UIStepper) {
    colorAlphaStepper.value = sender.value
         colorAlphaLabel.text = "Alpha: " + String(format: "%.1f", sender.value)
    theColorView.backgroundColor = UIColor(displayP3Red: CGFloat(colorRedCrayonDVC), green: CGFloat(colorGreenCrayonDVC), blue: CGFloat(colorBlueCrayonDVC), alpha: CGFloat(sender.value))
    alphaDVC = Float(sender.value)
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        guard let resetColorButton = colorDVC else {
            fatalError("resetButton error")
        }
        theColorView.backgroundColor = UIColor(displayP3Red: CGFloat(resetColorButton.red / 255), green: CGFloat(resetColorButton.green / 255), blue: CGFloat(resetColorButton.blue / 255), alpha: 0.6)
        
        colorRedLabel.text = "Red: \((Double(resetColorButton.red) / 255).description)"
        colorBlueLabel.text = "Blue: \((Double(resetColorButton.blue) / 255).description)"
        colorGreenLabel.text = "Green: \((Double(resetColorButton.green) / 255).description)"
        colorAlphaLabel.text = "Alpha: 0.6"
        colorRedCrayonDVC = Float(resetColorButton.red / 255)
        colorBlueCrayonDVC = Float(resetColorButton.blue / 255)
        colorGreenCrayonDVC = Float(resetColorButton.green / 255)
        alphaDVC = 0.6
        colorRedSlider.value = colorRedCrayonDVC
        colorBlueSlider.value = colorBlueCrayonDVC
        colorGreenSlider.value = colorGreenCrayonDVC
        colorAlphaStepper.value = 1.0
        
        
    }
    
    


}
       
