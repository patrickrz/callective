//
//  AttributeBoundViewController.swift
//  MDBProject2
//
//  Created by Kanu Grover on 10/15/20.
//  Copyright © 2020 Kanu Grover. All rights reserved.
//

import UIKit

class AttributeBoundViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    
    @IBOutlet var lowerBound: UITextField!
    
    @IBOutlet var upperBound: UITextField!
    
    
    @IBOutlet var attributeLabel: UILabel! {
        didSet {
            attributeLabel.text = attribute
        }
    }
    

    @IBAction func cancelButton(_ sender: Any) {
        mDelegate?.sendArraytoPreviousVC(myArray: [Int(lowerBound.text!), Int(upperBound.text!)], row: row)
        dismiss(animated: true, completion: nil)
    }
    
    let pickerData1 = Array(0...999)
    let pickerData2 = Array(0...999)
    
    var currentTextField = UITextField()
    var pickerView = UIPickerView()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    var attribute: String?
    
    var row = 0
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if currentTextField == lowerBound {
            return pickerData1.count
        } else {
            return pickerData2.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if currentTextField == lowerBound {
            return String(pickerData1[row])
        } else {
            return String(pickerData2[row])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if currentTextField == lowerBound {
            lowerBound.text = String(pickerData1[row])
            self.view.endEditing(true)
        } else {
            upperBound.text = String(pickerData2[row])
            self.view.endEditing(true)
        }
    
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        currentTextField = textField
        if currentTextField == lowerBound {
            lowerBound.inputView = pickerView
            lowerBound.textAlignment = .center
        } else {
            upperBound.inputView = pickerView
            upperBound.textAlignment = .center
        }
    }
    
    weak var mDelegate: SendingDataDelegate?

}

protocol SendingDataDelegate: class {
    func sendArraytoPreviousVC(myArray: [Int?], row: Int)
    func sendBoundstoPreviousVC(lower: [Int], upper: [Int])
}

extension SendingDataDelegate {
    func sendArraytoPreviousVC(myArray: [Int?], row: Int) {
        return
    }
    
    func sendBoundstoPreviousVC(lower: [Int], upper: [Int]) {
        return
    }
}
