//
//  HapticManager.swift
//  Orenji Watch App
//
//  Created by Ana Kiara Medeiros Braga on 22/11/22.
//

import Foundation
import SwiftUI

class HapticManager {
    
    static var instance = HapticManager()
    
    func play(type: WKHapticType) {
        
        WKInterfaceDevice.current().play(type)
        
    }
    
}
