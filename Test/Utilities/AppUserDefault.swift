//
//  AppUserDefault.swift
//  CumminsSouthPacific
//
//  Created by Ishan Weerasooriya on 3/17/17.
//  Copyright © 2017 Elegant Media. All rights reserved.
//

import Foundation

struct AppUserDefault {
    
    static let shared = UserDefaults.standard
    
    // FCM token
    static func setFCMToken(token: String) {
        shared.set(token, forKey: "FCM_TOKEN")
        shared.synchronize()
    }
    
    static func getFCMToken() -> String {
        if let token = shared.string(forKey: "FCM_TOKEN") {
            return token
        }
        return ""
    }
    
    // Agree to T&C
    static func setAgreeStatus(status: Bool) {
        shared.set(status, forKey: "AGREE_STATUS")
        shared.synchronize()
    }
    
    static func getAgreeStatus() -> Bool {
        let status = shared.bool(forKey: "AGREE_STATUS")
        return status
    }
}
