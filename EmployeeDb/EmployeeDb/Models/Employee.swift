//
//  Employee.swift
//  EmployeeDb
//
//  Created by Eisuke Tamatani on 1/23/20.
//  Copyright © 2020 Eisuke. All rights reserved.
//

import Foundation
import RealmSwift

class Employee: Object {
    
    @objc dynamic var employeeId = UUID().uuidString
    @objc dynamic var name = ""
    @objc dynamic var role = ""
    
    override static func primaryKey() -> String? {
        return "employeeId"
    }
    
    override static func indexedProperties() -> [String] {
        return ["role"]
    }
    
}
