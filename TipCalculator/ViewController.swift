//
//  ViewController.swift
//  TipCalculator
//
//  Created by 鈴木ちほり on 2021/01/06.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var totalBillLabel: UILabel!
    @IBOutlet var calculateBillBtn: UIButton!
    @IBOutlet var billAmountTextField: UITextField!
    @IBOutlet var tipSlider: UISlider!
    @IBOutlet var tipAmountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self

    }
    @IBAction func calculateBill(_ sender: Any) {
        let tipVal = tipSlider.value
        guard var total = Double(billAmountTextField.text!) else {
            return
        }
        total = total + (Double(tipVal) * total / 100)
        totalBillLabel.text = String(total)

    }
    @IBAction func perChanged(_ sender: Any) {
        tipAmountLabel.text = String(tipSlider.value)
    }
    
}
