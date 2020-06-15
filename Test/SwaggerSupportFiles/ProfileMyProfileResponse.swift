//
//  MyProfileResponse.swift
//  JamesAndDare
//
//  Created by Lahiru Chathuranga on 8/5/19.
//  Copyright © 2019 ElegantMedia. All rights reserved.
//

import Foundation
open class ProfileMyProfileResponse: Codable {
    
    public var message: String?
    public var result: Bool?
    public var payload: User?
    
    
    
    public init(message: String?, result: Bool?, payload: User?) {
        self.message = message
        self.result = result
        self.payload = payload
    }
    
    
    // Encodable protocol methods
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: String.self)
        
        try container.encodeIfPresent(message, forKey: "message")
        try container.encodeIfPresent(result, forKey: "result")
        try container.encodeIfPresent(payload, forKey: "payload")
    }
    
    // Decodable protocol methods
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)
        
        message = try container.decodeIfPresent(String.self, forKey: "message")
        result = try container.decodeIfPresent(Bool.self, forKey: "result")
        payload = try container.decodeIfPresent(User.self, forKey: "payload")
    }
}
