//
//  ContentView.swift
//  CH5-watchOS Watch App
//
//  Created by Luciano Uchoa on 07/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var percentage: CGFloat = 0
    
    var body: some View {
        VStack {
            Text("Passo 1/4")
            Circle()
                .overlay(
                    Text("Asset").colorInvert())
            NavigationLink(destination: StepView()){
                Text("Start")
                    .foregroundColor(Color.black)
            }.background(Color.buttonColor)
                .cornerRadius(50)
        }.navigationBarHidden(false)
            .navigationTitle("App")
            .edgesIgnoringSafeArea(.bottom)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
