//
//  LocalUser.swift
//  EM iOS Test
//
//  Created by Lahiru Chathuranga on 8/3/19.
//  Copyright © 2019 ElegantMedia. All rights reserved.
//

import Foundation
import RealmSwift

class LocalUser: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var avatarUrl: String = ""
    @objc dynamic var accessToken: String = ""
    @objc dynamic var second: Bool = false
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    // Get the first object of User Model
    class func current() -> LocalUser? {
        let users = try! Realm().objects(LocalUser.self)
        return users.first
    }
    
    class func saveLoginData(user: User) {
        guard (LocalUser.current() == nil) else {
            RealmService.shared.remove(objectsOfInstanceType: LocalUser.self) // Remove if exists
            self.createLocalUser(user: user) // Write user then
            return
        }
        
        self.createLocalUser(user: user) // Write user
    }
    
    class func createLocalUser(user: User) {
        let newUser = LocalUser()
        newUser.id = user._id ?? ""
        newUser.firstName = user.firstName ?? ""
        newUser.lastName = user.lastName ?? ""
        newUser.email = user.email ?? ""
        newUser.phone = user.phone ?? ""
        newUser.avatarUrl = user.avatarUrl ?? ""
        newUser.accessToken = user.accessToken ?? ""
        
        RealmService.shared.create(object: newUser)
    }
    
    class func UpdateProfileData(type: ProfileUpdateType, user: User?, avatar: String?) {
        if let currentUser = LocalUser.current() {
            switch type {
            case .Info:
                let dict: [String: Any?] = ["firstName": user?.firstName, "lastName": user?.lastName, "email": user?.email, "phone": user?.phone]
                RealmService.shared.update(object: currentUser, with: dict)
                break
            case .Avatar:
                let dict: [String: Any?] = ["avatar": avatar]
                RealmService.shared.update(object: currentUser, with: dict)
            default:
                break
            }
        }
    }
}

enum ProfileUpdateType {
    case Info, Avatar, Unknown
}
