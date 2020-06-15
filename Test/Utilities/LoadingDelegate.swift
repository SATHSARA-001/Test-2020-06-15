//
//  LoadingDelegate.swift
//  MediHub
//
//  Created by Dushan Saputhanthri on 29/3/19.
//  Copyright © 2019 Elegant Media Pvt Ltd. All rights reserved.
//

import Foundation
import UIKit
import RappleProgressHUD

protocol LoadingIndicatorDelegate {
    func startLoading()
    func startLoadingWithText(label: String)
    func stopLoading()
    func startLoadingWithProgress(current: CGFloat, total:CGFloat)
}

extension LoadingIndicatorDelegate {
    // -------- RappleProgressHUD -------- //
    // Start loading
    func startLoading() {
        RappleActivityIndicatorView.startAnimating()
    }
    
    // Start loading with text
    func startLoadingWithText(label: String) {
        RappleActivityIndicatorView.startAnimatingWithLabel(label)
    }
    
    // Stop loading
    func stopLoading() {
        RappleActivityIndicatorView.stopAnimation()
    }
    
    func startLoadingWithProgress(current: CGFloat, total:CGFloat) {
        RappleActivityIndicatorView.setProgress(current/total)
    }
}
