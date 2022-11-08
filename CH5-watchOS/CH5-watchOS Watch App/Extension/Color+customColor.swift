//
//  Color+customColor.swift
//  CH5-watchOS
//
//  Created by Luciano Uchoa on 08/11/22.
//

import SwiftUI

extension Color {
    static func rgb(r: Double, g: Double, b: Double) -> Color{
        return Color(red: r / 255, green: g / 255, blue: b / 255)
    }
    static let purpleColor = Color.rgb(r: 184, g: 185, b: 255)
    static let labelColor = Color.rgb(r: 255, g: 207, b: 184)
    static let trackColor = Color.rgb(r: 184, g: 242, b: 230)
    static let pulseColor = Color.rgb(r: 255, g: 209, b: 250)
    static let buttonColor = Color.rgb(r: 192, g: 250, b: 173)
}
