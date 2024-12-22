//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    var tipAmount = 10.0
    var bill = 0.0
    var numberOfPeople = 2
    var resultApproximate = "0.00"

    @IBOutlet weak var billTextField: UITextField!
    
    
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    
    @IBOutlet weak var splitNumber: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumber.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(tipAmount)
        var billText = billTextField.text!
        
        if billText != ""{
            //convert the value of the optional string into double
            bill = Double(billText)!
            
            // multiply the bill by the tip amount pecentage and divid by number of people
            let result = bill * (1 + tipAmount)/Double(numberOfPeople)
            
        //round result to 2 decimal place
            resultApproximate = String(format: "%.2f", result)
        }
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults"{
            //send data to resultviewcontroller
            let destinationVc = segue.destination as! ResultsViewController
            destinationVc.splitValue = resultApproximate
            
                        destinationVc.splitInfo = "Split between \(numberOfPeople) with \(tipAmount) tip"
            
        }
        
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        //disconnect the keyboard
        billTextField.endEditing(true)
        
        // detect the button true IBoutlet
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        //get the button title
        let buttonTitle = sender.currentTitle
        
        //separate the percentage sign from the title
        let buttonTitleMinusSign = String(buttonTitle!.dropLast())
         
        // convert buttonMinusSign to double
        
        let buttonValue = Double(buttonTitleMinusSign)
        tipAmount = buttonValue!/100
        
    }
}

