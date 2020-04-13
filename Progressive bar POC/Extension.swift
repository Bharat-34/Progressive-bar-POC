//
//  Extension.swift
//  Progressive bar POC
//
//  Created by Bharat on 13/04/20.
//  Copyright © 2020 Bharat. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {
    
    static func rgb(r: Double, g: Double, b: Double) -> Color {
        return Color(red: r / 225, green: g / 225, blue: b / 225)
    }
    static let backgroundColor = Color.rgb(r: 21, g: 22, b: 33)
    static let outlineColor = Color.rgb(r: 54, g: 225, b: 203)
    static let trackColor = Color.rgb(r: 45, g: 56, b: 95)
    static let pulsatingColor = Color.rgb(r: 73, g: 113, b: 148)
    
}

