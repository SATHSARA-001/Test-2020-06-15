//
//  Extentions.swift
//  EM iOS Test
//
//  Created by Dushan Saputhanthri on 19/3/19.
//  Copyright © 2019 Elegant Media Pvt Ltd. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

extension Dictionary {
    
    // To Update Parameter dictionary
    mutating func updateDictionary(otherValues: Dictionary) {
        for (key, value) in otherValues {
            self.updateValue(value, forKey: key)
        }
    }

    func nullKeyRemoval() -> Dictionary {
        var dict = self
        let keysToRemove = Array(dict.keys).filter { dict[$0] is NSNull || ((dict[$0] as? Int) == 0) || ((dict[$0] as? String) == "") }
        for key in keysToRemove {
            dict.removeValue(forKey: key)
        }
        return dict
    }
}

extension UITextField {
    func setBottomBorder(color: UIColor = .lightGray, height: CGFloat = 1.0) {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor

        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: height)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}

extension UISearchBar {
    
    func tfBackgroundColor(color: UIColor){
        for view in self.subviews {
            for subview in view.subviews {
                if subview is UITextField {
                    let textField: UITextField = subview as! UITextField
                    textField.backgroundColor = color
                }
            }
        }
    }
}

extension UIView {
    func addLayerEffects(with borderColor: UIColor? = nil, borderWidth: CGFloat = 0.0, cornerRadius: CGFloat = 0.0) {
        self.layer.borderColor = borderColor?.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }

    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }

    func addShadow(offSet: CGFloat = 2.0, color: UIColor = .lightGray) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: offSet, height: offSet)
        self.layer.shadowOpacity = 1
        self.layer.shouldRasterize = false
        self.layer.masksToBounds = false
    }

    func convertToImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0.0)
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        let snapshotImageFromMyView = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return snapshotImageFromMyView!
    }
    
    func applyGradient(isTopBottom: Bool, colorArray: [UIColor]) {
        if let sublayers = layer.sublayers {
            let _ = sublayers.filter({ $0 is CAGradientLayer }).map({ $0.removeFromSuperlayer() })
        }

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colorArray.map({ $0.cgColor })
        if isTopBottom {
            gradientLayer.locations = [0.0, 1.0]
        } else {
            //leftRight
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        }

        backgroundColor = .clear
        gradientLayer.frame = self.bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension String {
    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func removingAllWhitespaces() -> String {
        return removingCharacters(from: .whitespaces)
    }
    
    func removingCharacters(from set: CharacterSet) -> String {
        var newString = self
        newString.removeAll { char -> Bool in
            guard let scalar = char.unicodeScalars.first else { return false }
            return set.contains(scalar)
        }
        return newString
    }
    
    func convertBase64StringToImage() -> UIImage? {
        if let imageData = Data(base64Encoded: self, options: .init(rawValue: 0)) {
            let image = UIImage(data: imageData)
            return image
        }
        return nil
    }
}

extension UIImageView {
    func setImageWithUrl(_ urlString: String, placeholderImage: UIImage = UIImage()) {
        if let url = URL(string: urlString) {
            self.af_setImage(withURL: url, placeholderImage: placeholderImage)
        }
    }
}

extension UIButton {
    func setImageWithUrl(_ urlString: String, isBackground: Bool = false, state: UIControl.State = .normal, placeholderImage: UIImage = UIImage()) {
        if let url = URL(string: urlString) {
            switch isBackground {
            case true:
                self.af_setBackgroundImage(for: state, url: url, placeholderImage: placeholderImage)
            default:
                self.af_setImage(for: state, url: url, placeholderImage: placeholderImage)
            }
        }
    }
}

extension UIImage {
    func convertImageToData(type: ImageFormat) -> Data? {
        switch type {
        case .JPEG(let quality):
            if let imageData = self.jpegData(compressionQuality: quality) {
                return imageData
            }
        default:
            if let imageData = self.pngData() {
                return imageData
            }
        }
        return nil
    }
    
    func convertImageToBase64String(type: ImageFormat) -> String? {
        switch type {
        case .JPEG(let quality):
            let string = self.jpegData(compressionQuality: quality)?.base64EncodedString(options: .lineLength64Characters)
            return string
        default:
            let string = self.pngData()?.base64EncodedString(options: .lineLength64Characters)
            return string
        }
    }
}

extension Data {
    func convertDataToImage() -> UIImage? {
        if let image = UIImage(data: self) {
            return image
        }
        return nil
    }
    
    func convertDataToString() -> String? {
        let string = String(decoding: self, as: UTF8.self)
        return string
    }
}

extension UIStoryboard {
    ///The uniform place where we state all the storyboard we have in our application
    enum Storyboard: String {
        case Auth
        case Main
        
        var filename: String {
            return rawValue.capitalized
        }
    }
    
    //MARK: Convenience Initializer
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.filename, bundle: bundle)
    }
    
    //MARK: Class Functions
    class func storyboard(_ storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.filename, bundle: bundle)
    }
    
    //MARK: ViewController Instantiation from Generics
    func instantiateViewController<T>(withIdentifire identifire: T.Type) -> T where T: UIViewController {
        let className = String(describing: identifire)
        guard let vc = self.instantiateViewController(withIdentifier: className) as? T else {
            fatalError("cannot find controler with identifire \(className)")
        }
        return vc
    }
}

extension Bundle {
    var appName: String? {
        return infoDictionary?["CFBundleName"] as? String
    }

    var bundleId: String? {
        return bundleIdentifier
    }

    var versionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }

    var buildNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}

enum ImageFormat {
    case PNG
    case JPEG(CGFloat)
}
