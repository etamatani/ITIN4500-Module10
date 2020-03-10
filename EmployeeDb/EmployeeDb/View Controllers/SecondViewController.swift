//
//  SecondViewController.swift
//  EmployeeDb
//
//  Created by Eisuke Tamatani on 1/23/20.
//  Copyright © 2020 Eisuke. All rights reserved.
//

import UIKit
import RealmSwift

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var rolePickerView: UIPickerView!
    
    let roles = [Constants.designer, Constants.developer]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rolePickerView.dataSource = self
        rolePickerView.delegate = self
        
    }

    @IBAction func addTapped(_ sender: UIButton) {
        
        // Create an employee object and set its properties
        var e = Employee()
        e.name = nameTextField.text!
        e.role = roles[rolePickerView.selectedRow(inComponent: 0)]
        
        // Call employee service
        EmployeeService.addEmployee(e: e, roleType: e.role)
        
    }
    
}

extension SecondViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return roles.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return roles[row]
    }
}
