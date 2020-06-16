//
//  RegisterVM.swift
//  Test
//
//  Created by Sathsara Maduranga on 6/16/20.
//  Copyright © 2020 Sathsara Maduranga. All rights reserved.
//
import RxSwift
import RxCocoa
import SwiftyJSON



class RegisterVM: BaseVM {
    
    var firstName = BehaviorRelay<String>(value: "")
    var lastName = BehaviorRelay<String>(value: "")
    var email = BehaviorRelay<String>(value: "")
    var phone = BehaviorRelay<String>(value: "")
    var password = BehaviorRelay<String>(value: "")
    var confirmPassword = BehaviorRelay<String>(value: "")
    
    
    func userRegisterNetworkRequest(completion: @escaping completionHandler) {
        AuthAPI.registerPost(deviceId: "123",deviceType: "apple", email: email.value, password: password.value, passwordConfirmation: confirmPassword.value) { (response, error) in
            print(response,error)
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
    
    
    func validateUser() throws -> Bool {
        guard !email.value.isEmpty else {
            throw ValidateError.invalidData(.EmailEmpty)
        }
        guard !password.value.isEmpty else {
            throw ValidateError.invalidData(.PasswordEmpty)
        }
        guard Validator.shared.isValidEmail(email.value) else {
            throw ValidateError.invalidData(.InvalidEmail)
        }
        guard !confirmPassword.value.isEmpty else {
            throw ValidateError.invalidData(.ConfirmPasswordEmpty)
        }
        guard confirmPassword.value == password.value else {
            print(confirmPassword.value,password.value)
            throw ValidateError.invalidData(.MismatchingPasswords)
        }
        guard !phone.value.isEmpty else {
            throw ValidateError.invalidData(.PhoneEmpty)
        }
        guard !firstName.value.isEmpty else {
            throw ValidateError.invalidData(.FirstNameEmpty)
        }
        guard !lastName.value.isEmpty else {
            throw ValidateError.invalidData(.LastNameEmpty)
        }
        return true
    }
    
    
    func validateAndRegisterUser(completion: actionHandler) {
              do {
                  if try validateUser() {
                      completion(true, "success")
                  }
              } catch ValidateError.invalidData(let msg) {
                  completion(false, msg)
              } catch {
                  completion(false, .UnknownErrorOccured)
              }
          }
    
    
}
