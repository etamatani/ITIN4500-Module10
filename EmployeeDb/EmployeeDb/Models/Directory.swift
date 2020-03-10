//
//  Directory.swift
//  EmployeeDb
//
//  Created by Eisuke Tamatani on 1/23/20.
//  Copyright © 2020 Eisuke. All rights reserved.
//

import Foundation
import RealmSwift

class Directory: Object {
    
    var allEmployees = List<Employee>()
    var allDesigners = List<Employee>()
    var allDeveloper = List<Employee>()
}
