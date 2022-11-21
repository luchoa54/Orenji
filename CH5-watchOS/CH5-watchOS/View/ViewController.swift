//
//  ViewController.swift
//  CH5-watchOS
//
//  Created by Ana Kiara Medeiros Braga on 07/11/22.
//

import SwiftUI

struct ViewController : View {
    @State private var routine = RoutineInfo.datas

    //@StateObject var router = Router()
    
    var body: some View {
        
        NavigationView {
            if isAppAlreadyLaunchedOnce() {
                HomeView(routine: .constant(RoutineInfo.datas), shift: 0)
            }
            else {
                WelcomeView()
            }
            
        }
        //.environmentObject(router)
    }
}

func isAppAlreadyLaunchedOnce() -> Bool {
        let defaults = UserDefaults.standard
        if let _ = defaults.string(forKey: "laranjito") {
            print("App already launched")
            return true
        } else {
            defaults.set(true, forKey: "laranjito")
            print("App launched first time")
            return false
        }
    }
