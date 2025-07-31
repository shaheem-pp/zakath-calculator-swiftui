//
//  User.swift
//  ZakathCalculator
//
//  Created by Shaheem on 2025-07-30.
//

import Foundation
import SwiftData

@Model
final class User {
    var name: String
    var email: String
    var yearOfBirth: Int
    var createdOn: Date
    
    var zakatRecords: [ZakatRecord] = []
    
    init(name: String, email: String, yearOfBirth: Int, createdOn: Date = .now) {
        self.name = name
        self.email = email
        self.yearOfBirth = yearOfBirth
        self.createdOn = createdOn
    }
}
