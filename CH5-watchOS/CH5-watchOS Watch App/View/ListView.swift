//
//  ViewController.swift
//  CH5-watchOS Watch App
//
//  Created by Luciano Uchoa on 08/11/22.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        NavigationView{
            VStack(){
                Spacer(minLength: 30)
                Text("Suas rotinas")
                    .frame(maxWidth: .infinity,alignment: .leading)
                Image("faceSad")
                    .resizable()
                    .frame(width: 80, height: 80, alignment: .center)
                NavigationLink(destination: StepGuideView()){
                    CardView()
                        .frame(height: 74)
                }.frame(width: 154, height: 58)
                
                    
            }
        }.navigationBarBackButtonHidden(true)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

