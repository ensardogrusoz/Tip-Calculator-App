//
//  ViewController.swift
//  tip
//
//  Created by Kaan Dogrusoz on 8/17/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var outletSwitch: UISwitch!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var totalAmount: UILabel!
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var inView: UIView!
    
    @IBOutlet weak var darkModeLabel: UILabel!
    @IBOutlet weak var outputView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func darkAction(_ sender: Any) {
        if outletSwitch.isOn == true{
            view.backgroundColor = UIColor(named: "AlmostBlack")
            outputView.backgroundColor = UIColor(named: "tcMediumBlack")
            inView.backgroundColor = UIColor(named: "tcBlueBlack")
            headerView.backgroundColor = UIColor(named: "tcMediumBlack")
            totalLabel.textColor = UIColor.white
            tipAmount.textColor = UIColor.white
            totalAmount.textColor = UIColor.white
            tipPercentageLabel.textColor = UIColor.white
            darkModeLabel.textColor = UIColor.white
            tipControl.selectedSegmentTintColor = UIColor(named: "tcSeafoamGreen")
        }
        else{
            view.backgroundColor = UIColor(named: "tcOffWhite")
            outputView.backgroundColor = UIColor(named: "tcWhite")
            inView.backgroundColor = UIColor(named: "tcDarkBlue")
            headerView.backgroundColor = UIColor(named: "tcMediumBlack")
            totalLabel.textColor = UIColor.black
            tipAmount.textColor = UIColor.black
            totalAmount.textColor = UIColor.black
            tipPercentageLabel.textColor = UIColor.black
            darkModeLabel.textColor = UIColor.black
            headerView.backgroundColor = UIColor.white
            tipControl.selectedSegmentTintColor = UIColor(named: "tcHotPink")
            
            
        }
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //Get the initial bill amount and calculate the tips.
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2]
        
        //calculate tip and total
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //Update the tip and total labels
        var formatter: NumberFormatter {
            let format = NumberFormatter()
            format.numberStyle = .decimal
            format.numberStyle = .currency
            format.locale = Locale.current
            return format
        }
        // use formatter for decimal currency and local currency
        tipPercentageLabel.text = formatter.string(from: tip as NSNumber)!
        totalLabel.text = formatter.string(from: total as NSNumber)
//        tipPercentageLabel.text = String(format: "$%.2f",tip)
//        totalLabel.text = String(format: "$%.2f",total)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        DispatchQueue.main.async {
            self.billAmountTextField.becomeFirstResponder()
        }

    }
    

}

