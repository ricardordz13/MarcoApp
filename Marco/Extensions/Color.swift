//
//  Color.swift
//  Marco
//
//  Created by Ricardo Jorge Rodriguez Trevino on 17/11/24.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        self.init(
            UIColor(
                red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(hex & 0x0000FF) / 255.0,
                alpha: CGFloat(alpha)
            )
        )
    }
    
    static func brighten(hex: UInt, percentage: CGFloat = 0.5) -> Color {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000FF) / 255.0
        
        let hsl = rgbToHsl(r: red, g: green, b: blue)
        let newLightness = min(hsl.l + percentage, 1.0)
        let newRgb = hslToRgb(h: hsl.h, s: hsl.s, l: newLightness)
        
        return Color(red: Double(newRgb.r), green: Double(newRgb.g), blue: Double(newRgb.b))
    }
    
    static func darken(hex: UInt, percentage: CGFloat = 0.5) -> Color {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000FF) / 255.0
        
        let hsl = rgbToHsl(r: red, g: green, b: blue)
        let newLightness = max(hsl.l - percentage, 0.0)  // subtract the percentage from the lightness
        let newRgb = hslToRgb(h: hsl.h, s: hsl.s, l: newLightness)
        
        return Color(red: Double(newRgb.r), green: Double(newRgb.g), blue: Double(newRgb.b))
    }
    
    private static func rgbToHsl(r: CGFloat, g: CGFloat, b: CGFloat) -> (h: CGFloat, s: CGFloat, l: CGFloat) {
        let maxVal = max(r, g, b)
        let minVal = min(r, g, b)
        var h: CGFloat = 0, s: CGFloat = 0, l: CGFloat = 0
        
        l = (maxVal + minVal) / 2.0
        
        if maxVal == minVal {
            h = 0
            s = 0
        } else {
            let d = maxVal - minVal
            s = l > 0.5 ? d / (2.0 - maxVal - minVal) : d / (maxVal + minVal)
            switch maxVal {
            case r:
                h = (g - b) / d + (g < b ? 6 : 0)
            case g:
                h = (b - r) / d + 2
            case b:
                h = (r - g) / d + 4
            default:
                break
            }
            h /= 6
        }
        
        return (h, s, l)
    }
    
    private static func hslToRgb(h: CGFloat, s: CGFloat, l: CGFloat) -> (r: CGFloat, g: CGFloat, b: CGFloat) {
        let q = l < 0.5 ? l * (1 + s) : l + s - l * s
        let p = 2 * l - q
        
        func hueToRgb(p: CGFloat, q: CGFloat, t: CGFloat) -> CGFloat {
            var t = t
            if t < 0 { t += 1 }
            if t > 1 { t -= 1 }
            if t < 1/6 { return p + (q - p) * 6 * t }
            if t < 1/2 { return q }
            if t < 2/3 { return p + (q - p) * (2/3 - t) * 6 }
            return p
        }
        
        let r = hueToRgb(p: p, q: q, t: h + 1/3)
        let g = hueToRgb(p: p, q: q, t: h)
        let b = hueToRgb(p: p, q: q, t: h - 1/3)
        
        return (r, g, b)
    }
}
