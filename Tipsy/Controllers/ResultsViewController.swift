//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by MACBOOK on 7/31/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var splitValue: String?
    var splitInfo: String?
    
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalLabel.text = splitValue
        settingLabel.text = splitInfo
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
