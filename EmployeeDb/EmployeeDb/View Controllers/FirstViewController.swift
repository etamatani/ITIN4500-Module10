//
//  FirstViewController.swift
//  EmployeeDb
//
//  Created by Eisuke Tamatani on 1/23/20.
//  Copyright © 2020 Eisuke. All rights reserved.
//

import UIKit
import RealmSwift

class FirstViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
    
    var employees: List<Employee>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the segmented control
        segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        // Configure the tableview
        tableView.delegate = self
        tableView.dataSource = self
        
        // Print out the file path to the Realm file
        print(Realm.Configuration.defaultConfiguration.fileURL)

        // Retrieve All Employee
        retrieveEmployee(role: "")
    }

    @objc func segmentChanged() {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            retrieveEmployee(role: Constants.all)
        case 1:
            retrieveEmployee(role: Constants.designer)
        case 2:
            retrieveEmployee(role: Constants.developer)
        default:
            retrieveEmployee(role: Constants.all)
        }
        
    }
    
    func retrieveEmployee(role:String){
        
        // Grab employees
        employees = EmployeeService.getEmployees(roleType: role)
        
        // Reload tableView
        tableView.reloadData()
        
    }

}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees == nil ? 0 : employees!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell", for: indexPath)
        
        if employees != nil {
            cell.textLabel?.text = employees![indexPath.row].name
        }
        
        return cell
    }
}
