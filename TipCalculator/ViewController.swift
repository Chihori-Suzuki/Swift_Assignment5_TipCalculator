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
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
        view.addGestureRecognizer(gestureRecognizer)
        scrollView.contentInset = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)
    }
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
      view.endEditing(true)
    }
     
    @IBAction func calculateBill(_ sender: Any) {
        var tipVal = tipSlider.value * 100
        tipVal.round()
        guard var total = Double(billAmountTextField.text!) else {
            return
        }
        total = total + (Double(tipVal) / 100 * total)
        totalBillLabel.text = "$\(String(format: "%.2f", total))"
    }
    
    @IBAction func perChanged(_ sender: Any) {
        print(tipSlider.value)
        tipAmountLabel.text = "\(String(format: "%.0f", tipSlider.value * 100))%"
        var tipVal = tipSlider.value * 100
        tipVal.round()
        
        guard var total = Double(billAmountTextField.text!) else {
            return
        }
        total = total + (Double(tipVal) / 100 * total)
        totalBillLabel.text = "$\(String(format: "%.2f", total))"
        
    }
    
}
