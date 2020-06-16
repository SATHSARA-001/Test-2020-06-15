//
//  AppUserDefault.swift
//  CumminsSouthPacific
//
//  Created by Ishan Weerasooriya on 3/17/17.
//  Copyright © 2017 Elegant Media. All rights reserved.
//

import Foundation

struct Defaults {
    
    static let defaults=UserDefaults.standard
    
    static func userAgreed() {
        defaults.set(true, forKey: "isAgreed")
        defaults.synchronize()
    }
    
    static func isAgreed()-> Bool {
        let status = defaults.bool(forKey: "isAgreed")
        return status
    }
    
    static func loggedIn() {
        defaults.set(true, forKey: "isLoggedIn")
        defaults.synchronize()
    }
    
    static func isLoggedIn()->Bool {
        let status = defaults.bool(forKey: "isLoggedIn")
        return status
    }
}
