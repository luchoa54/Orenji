//
//  ContentView.swift
//  CH5-watchOS
//
//  Created by Luciano Uchoa on 07/11/22.
//

import SwiftUI

struct ContentView: View {
    @Binding var routine: RoutineInfo
    
    var body: some View {
        VStack {
            NavigationLink(destination: StepByStepView(routine: $routine), label: {
                Text("start")
                    .background(Color.buttonBackground)
                    .cornerRadius(8)
                    .foregroundColor(.white)
            })
        }
        .padding()
        .navigationBarBackButtonHidden()
        .navigationTitle("App")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(routine: .constant(RoutineInfo.datas[0]))
    }
}
