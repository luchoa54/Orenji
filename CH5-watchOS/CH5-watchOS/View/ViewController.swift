//
//  ViewController.swift
//  CH5-watchOS
//
//  Created by Ana Kiara Medeiros Braga on 07/11/22.
//

import SwiftUI

struct ViewController : View {
    @State private var routine = RoutineInfo.datas
    
    var body: some View {
        
        NavigationView {
            if isAppAlreadyLaunchedOnce() {
                HomeView(routine: $routine, shift: 0)
            }
            else {
                WelcomeView(routine: $routine)
            }
            
        }
        
    }
}

func isAppAlreadyLaunchedOnce() -> Bool {
        let defaults = UserDefaults.standard
        if let _ = defaults.string(forKey: "laranjito") {
            return true
        } else {
            defaults.set(true, forKey: "laranjito")
            return false
        }
    }
