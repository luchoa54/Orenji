//
//  ContentView.swift
//  CH5-watchOS Watch App
//
//  Created by Luciano Uchoa on 07/11/22.
//

import SwiftUI

struct ContentView: View {
    @Binding var skincare: DailySkinCare
    @State var passoAtual: Int = 1
    @State var percentage: CGFloat = 0
    @State var backButtonStatus: Bool = false
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 80, height: 25)
                .foregroundColor(Color.backgroundColor)
                .cornerRadius(10)
                .overlay(
                    Text("Passo \(passoAtual) / \(skincare.qtPassos)")
                )
            Text("\(skincare.titulo[passoAtual - 1])")
            Circle()
                .overlay(
                    Text("Asset").colorInvert())
            NavigationLink(destination: StepView(skincare: $skincare, passoAtual: $passoAtual)){
                Text("Start")
                    .foregroundColor(Color.black)
            }.background(Color.purpleColor)
                .cornerRadius(50)
        }.navigationBarBackButtonHidden(backButtonStatus)
            .navigationTitle("\(skincare.turno)")
            .edgesIgnoringSafeArea(.bottom)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(skincare: .constant(DailySkinCare.sampleData[0]))
    }
}


