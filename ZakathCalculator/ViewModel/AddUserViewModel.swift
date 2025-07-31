//
//  AddUserViewModel.swift
//  ZakathCalculator
//
//  Created by Shaheem on 2025-07-30.
//

import Foundation
import SwiftData

class AddUserViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var yearOfBirth: String = ""
    
    @Published var isUserCreated: Bool = false
    
    
    enum UserCreationResult {
        case success
        case failure(reason: String)
    }
    
    func createUser(using context: ModelContext) -> UserCreationResult {
        guard !name.isEmpty else {
            return .failure(reason: "Name is required")
        }
        
        guard !email.isEmpty else {
            return .failure(reason: "Email is required")
        }
        
        guard isValidEmail(email) else {
            return .failure(reason: "Enter a valid email address")
        }
        
        guard let year = Int(yearOfBirth) else {
            return .failure(reason: "Year of Birth must be a number")
        }
        
        let user = User(name: name, email: email, yearOfBirth: year)
        print("User created: \(user)")
        
        context.insert(user)
        
        isUserCreated = true
        return .success
    }
    
    func resetFields() {
        name = ""
        email = ""
        yearOfBirth = ""
        isUserCreated = false
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: email)
    }
}
