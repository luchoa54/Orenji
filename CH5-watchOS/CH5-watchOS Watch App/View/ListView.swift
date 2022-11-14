//
//  ViewController.swift
//  CH5-watchOS Watch App
//
//  Created by Luciano Uchoa on 08/11/22.
//

import SwiftUI

struct ListView: View {
    
    @State var isActive : Bool = false
    
    var body: some View {
        NavigationView{
            VStack(){
                Spacer(minLength: 30)
                Text("Suas rotinas")
                    .frame(maxWidth: .infinity,alignment: .leading)
                Image("mainsad")
                    .resizable()
                    .frame(width: 68, height: 79, alignment: .center)
                NavigationLink(destination: StepGuideView(rootIsActive: self.$isActive), isActive: self.$isActive){
                    CardView()
                        .frame(height: 74)
                }.frame(width: 154, height: 58)
                
                    
            }
        }.navigationBarBackButtonHidden(true)
            .edgesIgnoringSafeArea(.all)
            .navigationTitle("App")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

