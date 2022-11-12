//
//  ContentView.swift
//  CH5-watchOS Watch App
//
//  Created by Luciano Uchoa on 07/11/22.
//

import SwiftUI

struct StepGuideView: View {
    
    @State var passoAtual: Int = 1
    @State var backButtonStatus: Bool = false
    
    var body: some View {
        VStack {
            Spacer(minLength: 25)
            Rectangle()
                .frame(width: 67, height: 19)
                .foregroundColor(.backgroundColor)
                .cornerRadius(8)
                .overlay(
            Text("Passo \(passoAtual) / 3")
                .font(.system(size: 11, weight: .semibold))
            )
            Text("Limpeza do Rosto")
                .font(.system(size: 11,weight: .semibold))
            Image("wash")
                .resizable()
                .frame(width: 80, height: 72)
            Spacer()
            NavigationLink(destination: TimerView(passoAtual: $passoAtual)){
                Text("Iniciar")
            }.background(Color.purpleColor)
                .cornerRadius(50)
                .foregroundColor(Color.black)
        }.navigationTitle("Manhã")
    }
}


struct StepGuideView_Previews: PreviewProvider {
    static var previews: some View {
        StepGuideView()
    }
}


