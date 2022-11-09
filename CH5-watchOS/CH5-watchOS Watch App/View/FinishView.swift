//
//  FinishView.swift
//  CH5-watchOS Watch App
//
//  Created by Luciano Uchoa on 08/11/22.
//

import SwiftUI

struct FinishView: View {
    @Binding var skincare: DailySkinCare
    
    var body: some View {
        VStack {
            Text("Rotina Feita!")
            Circle()
                .overlay(
                    Text("Asset Feliz :)").colorInvert())
            NavigationLink(destination: ViewController().navigationTitle("App")
                .navigationBarTitleDisplayMode(.inline)){
                Text("OK")
                    .foregroundColor(Color.black)
            }.background(Color.purpleColor)
                .cornerRadius(50)
            
        }.navigationBarHidden(false)
            .navigationTitle("Concluído")
            .edgesIgnoringSafeArea(.bottom)
    }
}

struct FinishView_Previews: PreviewProvider {
    static var previews: some View {
        FinishView(skincare: .constant(DailySkinCare.sampleData[0]))
    }
}
