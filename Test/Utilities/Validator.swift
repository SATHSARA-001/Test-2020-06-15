//
//  Validator.swift
//  CumminsSouthPacific
//
//  Created by Lahiru Chathuranga on 1/30/19.
//  Copyright © 2019 Elegant Media pvt ltd. All rights reserved.
//

import Foundation

class Validator {
    static let shared = Validator()
    
    // Validations
    func isValidEmail(_ email: String) -> Bool {
        if email.isEmpty {
            return false
        } else {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: email)
        }
    }
    
    func isValidPhone(_ phone: String) -> Bool {
        if phone.isEmpty {
            return false
        } else {
            let phoneRegEx = "^[+]?[0-9]{5,15}$"
            
            let phoneTest = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
            return phoneTest.evaluate(with: phone)
        }
    }
}

enum ValidateError: Error {
    case invalidData(String)
}

