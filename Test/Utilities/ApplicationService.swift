//
//  ApplicationService.swift
//  EM iOS Test
//
//  Created by Dushan Saputhanthri on 19/3/19.
//  Copyright © 2019 Elegant Media Pvt Ltd. All rights reserved.
//

import UIKit
import RealmSwift

class ApplicationService {
    
    static let shared = ApplicationService()
    
    let bundleId = Bundle.main.bundleIdentifier ?? ""
    let deviceId = UIDevice.current.identifierForVendor!.uuidString
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    let deviceType = "APPLE"
    
    private init() {}
    
    func configure() {
        manageUIAppearance()
        printRealmPath()
    }
    
    private func manageUIAppearance() {
        // Set navigation bar tint / background color
        UINavigationBar.appearance().isTranslucent = false
        
        // Set navigation bar item tint color
        UIBarButtonItem.appearance().tintColor = .darkGray
        
        // Set navigation bar back button tint color
        UINavigationBar.appearance().tintColor = .darkGray
        
        // Set back button image
//        let backImage = UIImage(named: "ic_back")
//        UINavigationBar.appearance().backIndicatorImage = backImage
//        UINavigationBar.appearance().backIndicatorTransitionMaskImage = backImage
        
        // To remove the 1px seperator at the bottom of navigation bar
//        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
//        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    private func printRealmPath() {
        print("Realm path: \(String(describing: try! Realm().configuration.fileURL))")
    }
    
    public func manageUserDirection(from vc: UIViewController? = nil, window: UIWindow? = nil) {
        guard LocalUser.current() != nil else {
            let agreeStatus = AppUserDefault.getAgreeStatus()
            switch agreeStatus {
            case true:
                directToPath(in: .Auth, for: .AuthNC, from: vc, window: window)
            default:
                directToPath(in: .Auth, for: .WelcomeNC, from: vc, window: window)
            }
            return
        }
        directToPath(in: .Main, for: .MainTBC, from: vc, window: window)
    }
    
    public func directToPath(in sb: UIStoryboard.Storyboard, for identifier: String, from vc: UIViewController? = nil, window: UIWindow? = nil, data: Any? = nil) {
        let storyboard = UIStoryboard(storyboard: sb)
        let rootController = storyboard.instantiateViewController(withIdentifier: identifier)
        
        appDelegate.setRoot(_controller: rootController)
    }
    
    public func pushViewController(in sb: UIStoryboard.Storyboard, for identifire: String, from vc: UIViewController?, data: Any? = nil) {
        let storyboard = UIStoryboard(storyboard: sb)
        let destVc = storyboard.instantiateViewController(withIdentifier: identifire)
        
        vc?.navigationController?.pushViewController(destVc, animated: true)
    }
    
    public func presentViewController(in sb: UIStoryboard.Storyboard, for identifire: String, from vc: UIViewController?, style: UIModalPresentationStyle = .overCurrentContext, data: Any? = nil) {
        let storyboard = UIStoryboard(storyboard: sb)
        let destVc = storyboard.instantiateViewController(withIdentifier: identifire)
        
        destVc.modalPresentationStyle = style
        
        vc?.present(destVc, animated: true, completion: nil)
    }
    
    public func viewController(in sb: UIStoryboard.Storyboard, identifier: String) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: sb)
        let targetVC = storyboard.instantiateViewController(withIdentifier: identifier)
        return targetVC
    }
}
