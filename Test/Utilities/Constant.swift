//
//  Constant.swift
//  EM iOS Test
//
//  Created by Dushan Saputhanthri on 19/3/19.
//  Copyright © 2019 Elegant Media Pvt Ltd. All rights reserved.
//

import Foundation
import UIKit

struct Constant {
    
    static let appEnvironment: DeploymentEnvironment = .development
    
    enum DeploymentEnvironment: String {
        case development = "http://oxygen.sandbox15.preview.cx/api/v1"
        case staging = "http://.."
        case production = "http://..."
       
        
        
    }
    
    func getCustomHeaders() -> [String:String] {
        switch Constant.appEnvironment {
        case .development:
            return ["x-api-key": "cXRZWOedaKl2QIdUsfAie4bW8jdFB3Fib1FE/dvznJM="]
        case .staging:
            return ["x-api-key": ""]
        case .production:
            return ["x-api-key": ""]
        }
    }
    
    enum APIKeys {
        static let RESTful = ""
        static let googleMap = ""
    }
    
    enum Counts {
        static let passwordCount = 6
    }
    
    enum AppDetails {
        static let termsUrl = "https://www.elegantmedia.com.au/"
        static let privacyUrl = "https://www.elegantmedia.com.au/privacy-policy/"
        static let aboutUrl = "https://www.elegantmedia.com.au/about-us/"
    }
    
    enum ColorSets {
        static let backgroundGradient: [UIColor] = [.backgroundColor1, .backgroundColor2]
        static let buttonGradient: [UIColor] = [.buttonColor1, .buttonColor2]
    }
    
    enum Notification {
        
    }
}
