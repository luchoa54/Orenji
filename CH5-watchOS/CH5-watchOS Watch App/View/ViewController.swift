//
//  ViewController.swift
//  CH5-watchOS Watch App
//
//  Created by Luciano Uchoa on 08/11/22.
//

import SwiftUI

struct ViewController: View {
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                Text("Lugar das rotinas")
                Spacer()
                Rectangle()
                    .cornerRadius(10)
                    .frame(height: 50)
                    .overlay(
                        Text("Manhã").colorInvert())
                Spacer()
                NavigationLink(destination: ContentView()){
                    Text("Começar rotina").foregroundColor(Color.black)
                }.background(Color.buttonColor)
                    .cornerRadius(50)
            }
        }.navigationBarHidden(true)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewController()
    }
}
