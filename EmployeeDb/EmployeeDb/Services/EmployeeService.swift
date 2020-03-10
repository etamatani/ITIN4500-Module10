//
//  EmployeeService.swift
//  EmployeeDb
//
//  Created by Eisuke Tamatani on 1/23/20.
//  Copyright © 2020 Eisuke. All rights reserved.
//

import Foundation
import RealmSwift

class EmployeeService {
    
    private static var directory:Directory = {
        
        // Check the realm file for an existing directory object
        let realm = try! Realm()
        var dir = realm.objects(Directory.self).first
        
        if dir != nil {
            // Return the one from the database
            return dir!
        }
        else {
            // If it doesn't exist, create a new one and save it
            dir = Directory()
            
            try! realm.write {
                
                // Add it to the realm file
                realm.add(dir!)
                
            }
            
            return dir!
        }
        
    } ()
    
    static func addEmployee(e: Employee, roleType: String) {
        
        let realm = try! Realm()
        
        try! realm.write {
            
            // Add the employee to all employees list
            directory.allEmployees.append(e)
            
            // Also add employee to designers or developers list
            if roleType == Constants.developer {
                directory.allDeveloper.append(e)
            }
            else if roleType == Constants.designer {
                directory.allDesigners.append(e)
            }
            
        }
        
    }
    
    static func getEmployees(roleType:String) -> List<Employee> {
        
        // Return the employee lists based on what role type is asked for
        switch roleType {
            
        case Constants.developer:
            return directory.allDeveloper
        case Constants.designer:
            return directory.allDesigners
        default:
            return directory.allEmployees
        }
    }
    
}
