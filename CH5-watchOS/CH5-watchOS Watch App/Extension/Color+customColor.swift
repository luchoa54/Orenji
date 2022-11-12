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
    static let backgroundColor = Color.rgb(r: 30, g: 30, b: 30)
    static let timerColor = Color.rgb(r: 43, g: 43, b: 53)
    static let pulseColor = Color.rgb(r: 255, g: 209, b: 250)
    static let pausedColor = Color.rgb(r: 207, g: 208, b: 227)
}
