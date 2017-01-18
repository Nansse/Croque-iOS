//
//  Extention.swift
//  Croque
//
//  Created by Gauthier de Chezelles on 01/11/2016.
//  Copyright © 2016 Agepoly. All rights reserved.
//

import UIKit

typealias Colors = (dark: UIColor, light: UIColor)
let serverURL = "http://agepolysrv1.epfl.ch:8043"

class CRColor {
    
    static var backgroundGray: UIColor = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.00)
    
    static var darkRed = UIColor(hex: 0xBF3048)
    static var lightRed = UIColor(hex: 0xFFE3E3)
    
    static var darkGreen = UIColor(red:0.29, green:0.50, blue:0.10, alpha:1.00)
    static var lightGreen = UIColor(red:0.81, green:0.92, blue:0.71, alpha:1.00)
    
    static var darkBrown = UIColor(red:0.70, green:0.42, blue:0.10, alpha:1.00)
    static var lightBrown = UIColor(red:0.96, green:0.85, blue:0.73, alpha:1.00)
    
    static var darkOceanBlue = UIColor(red:0.17, green:0.51, blue:0.55, alpha:1.00)
    static var lightOceanBlue = UIColor(red:0.74, green:0.89, blue:0.90, alpha:1.00)
    
    static var darkPurple = UIColor(red:0.53, green:0.29, blue:0.65, alpha:1.00)
    static var lightPurple = UIColor(red:0.85, green:0.78, blue:0.89, alpha:1.00)
    
    static var darkBlue = UIColor(red:0.25, green:0.27, blue:0.59, alpha:1.00)
    static var lightBlue = UIColor(red:0.71, green:0.72, blue:0.91, alpha:1.00)
    
    static var darkYellow = UIColor(red:0.75, green:0.55, blue:0.11, alpha:1.00)
    static var lightYellow = UIColor(red:1.00, green:0.89, blue:0.65, alpha:1.00)
    
    static var darkGray = UIColor(hex: 0x7D7D7D)
    static var lightGray = UIColor(hex: 0xE5E5E5)
    
    static var darkColors = [darkRed, darkGreen, darkBrown, darkOceanBlue, darkPurple, darkBlue, darkYellow]
    static var lightColors = [lightRed, lightGreen, lightBrown, lightOceanBlue, lightPurple, lightBlue, lightYellow]
    
    private static var all: [Colors] {
        var array = [Colors]()
        
        for i in 0..<darkColors.count {
            array.append((dark: darkColors[i], light: lightColors[i]))
        }
        return array
    }
    
    static var randomColors: Colors {
        
        let randomIndex = Int(arc4random_uniform(UInt32(darkColors.count)))
        return all[randomIndex]
    }
    
    // MARK: - Infinit list of random colors
    
    /// Infinit list of random colors always in the same order during one session
    static var allRandoms = ArrayColors()
    
    /// List of original colors used by randomColorsArray to always return different colors
    static private var originalColors = [Colors]()
    /// Returns a list of colors all different
    fileprivate static func randomColorsArray(numberOfElements: Int) -> [Colors] {
        
        var colors = [Colors]()
        for _ in 0..<numberOfElements{
            
            if CRColor.originalColors.count == 0 { CRColor.originalColors = all }
            let randomIndex = Int(arc4random_uniform(UInt32(CRColor.originalColors.count)))
            colors.append(originalColors[randomIndex])
            originalColors.remove(at: randomIndex)
        }
        return colors
    }
    
    
}

struct ArrayColors {
    static private var allRandoms = [Colors]()
    subscript(index: Int) -> Colors {
        let numberOfMissingColors = index - ArrayColors.allRandoms.count
        if numberOfMissingColors >= 0 {
            ArrayColors.allRandoms += CRColor.randomColorsArray(numberOfElements: index + 1)
        }
        return ArrayColors.allRandoms[index]
    }
}


extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(hex:Int) {
        self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff)
    }
}


extension UILabel{
    func addTextSpacing(spacing: CGFloat){
        let attributedString = NSMutableAttributedString(string: self.text!)
        attributedString.addAttribute(NSKernAttributeName, value: spacing, range: NSRange(location: 0, length: self.text!.characters.count))
        self.attributedText = attributedString
    }
}
extension NSMutableAttributedString {
    func addTextSpacing(spacing: CGFloat) {
        self.addAttribute(NSKernAttributeName, value: spacing, range: NSRange(location: 0, length: self.length))
    }
}

extension UIColor {
    /// Transforms a color to a one pixel image of that color for navigation bar
    func as1ptImage() -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        let ctx = UIGraphicsGetCurrentContext()
        self.setFill()
        ctx!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

extension String {
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return boundingBox.height
    }
}

extension NSAttributedString {
    func heightWithConstrainedWidth(width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        
        return boundingBox.height
    }
}
