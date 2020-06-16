//
//  LoginVM.swift
//  Test
//
//  Created by Sathsara Maduranga on 6/16/20.
//  Copyright © 2020 Sathsara Maduranga. All rights reserved.
//
import UIKit
import RxSwift
import RxCocoa
import SwiftyJSON

class LoginVM: BaseVM {
    
    
    var email = BehaviorRelay<String>(value: "")
    var password = BehaviorRelay<String>(value: "")
    
    
    
    func loginAttempt(completion: @escaping completionHandler) {
        AuthAPI.loginPost(deviceId: "12345", deviceType: "Apple", email: email.value, password: password.value) { (response, error) in
            if error != nil {
                if let errorResponse = error as? ErrorResponse {
                    switch errorResponse {
                    case .error(let statusCode, let data, _):
                        guard let responseData = data else {return}
                        let jsonError = JSON(responseData)
                        completion(false, statusCode, jsonError["message"].stringValue)
                    }
                }
            } else {
                guard let jsonResponse = response?.payload else {return}
                LocalUser.saveLoginData(user: jsonResponse)
                completion(true, 200, "success")
            }
        }
    }

    
    func validated() throws -> Bool {
        guard !email.value.isEmpty else {
            throw ValidateError.invalidData(.EmailEmpty)
        }
        guard !password.value.isEmpty else {
            throw ValidateError.invalidData(.PasswordEmpty)
        }
        guard Validator.shared.isValidEmail(email.value) else {
            throw ValidateError.invalidData(.InvalidEmail)
        }
        return true
    }
    
    

    
    
}
