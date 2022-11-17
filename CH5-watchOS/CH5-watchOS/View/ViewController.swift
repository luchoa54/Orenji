//
//  ViewController.swift
//  CH5-watchOS
//
//  Created by Ana Kiara Medeiros Braga on 07/11/22.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var hasOnboarded: Bool
    
    init(hasOnboarded: Bool) {
        self.hasOnboarded = hasOnboarded
    }
}

struct ViewController : View {
    @State private var routine = RoutineInfo.datas
    @ObservedObject var appState = AppState(hasOnboarded: false)
    var body: some View {
        
//        NavigationView {
//            HomeView(routine: .constant(RoutineInfo.datas))
//        }
        
        NavigationView {
            if appState.hasOnboarded {
                HomeView(routine: .constant(RoutineInfo.datas))
                    .environmentObject(appState)
            }
            else {
                welcomeView(routine: .constant(RoutineInfo.datas[0]))
                    .environmentObject(appState)
            }
        }
    }
}
