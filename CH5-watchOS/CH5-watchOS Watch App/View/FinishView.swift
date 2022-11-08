//
//  FinishView.swift
//  CH5-watchOS Watch App
//
//  Created by Luciano Uchoa on 08/11/22.
//

import SwiftUI

struct FinishView: View {
    
    var body: some View {
        VStack {
            Text("Rotina Feita!")
            Circle()
                .overlay(
                    Text("Asset Feliz :)").colorInvert())
            NavigationLink(destination: ViewController()){
                Text("OK")
                    .foregroundColor(Color.black)
            }.background(Color.buttonColor)
                .cornerRadius(50)
        }.navigationBarHidden(false)
            .navigationTitle("Concluído")
            .edgesIgnoringSafeArea(.bottom)
    }
}

struct FinishView_Previews: PreviewProvider {
    static var previews: some View {
        FinishView()
    }
}
