//
//  ViewController.swift
//  CH5-watchOS
//
//  Created by Ana Kiara Medeiros Braga on 07/11/22.
//

import SwiftUI

//class AppState: ObservableObject {
//    @Published var hasOnboarded: Bool
//
//    init(hasOnboarded: Bool) {
//        self.hasOnboarded = hasOnboarded
//    }
//}

struct ViewController : View {
    @State private var routine = RoutineInfo.datas
    //@AppStorage("HAS ONBOARD") var show = false

//    @ObservedObject var appState = AppState(hasOnboarded: false)
    var body: some View {
        
//        NavigationView {
//            HomeView(routine: .constant(RoutineInfo.datas))
//        }
        
        NavigationView {
            
            
            if isAppAlreadyLaunchedOnce() {
                HomeView(routine: .constant(RoutineInfo.datas))
            }
            else {
                welcomeView(routine: .constant(RoutineInfo.datas[0]))
            }
        }
    }
}

func isAppAlreadyLaunchedOnce() -> Bool {
        let defaults = UserDefaults.standard
        if let _ = defaults.string(forKey: "isAppAlreadyLaunchedOnce") {
            print("App already launched")
            return true
        } else {
            defaults.set(true, forKey: "isAppAlreadyLaunchedOnce")
            print("App launched first time")
            return false
        }
    }
