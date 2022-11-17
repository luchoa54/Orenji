//
//  welcomeView.swift
//  CH5-watchOS
//
//  Created by Ana Kiara Medeiros Braga on 16/11/22.
//

import SwiftUI

struct welcomeView: View {
    
    @State private var orangeName: String = "laranjito"
    @Binding var routine: [RoutineInfo]

    var body: some View {
        VStack {
            
            Spacer()
            
            HStack {
                Text("Seja bem-vindo!")
                    .font(.system(size: 24))
                    .fontWeight(.black)
                    .foregroundColor(.titleColor)
                    .padding()
                
                Spacer()
            }
            
            Spacer()
            
            VStack (spacing: 20){
                Text("Antes de começarmos, que tal nomear sua laranjinha?")
                    .font(.system(size: 17))
                    .foregroundColor(.titleColor)
                            
                TextField("Qual meu nome?", text: $orangeName)
                    .padding()
                    .background(Color.orangeNameBackground)
                    .cornerRadius(12)
            }
            .padding()
            
            Spacer()
            
            Image("mainhappy")
            
            Spacer()
            
            NavigationLink(destination: HomeView(routine: .constant(RoutineInfo.datas))) {
                    Text("Vamos lá!")
                        .foregroundColor(.textButtonStep)
                        .font(.system(size: 17))
                        .frame(width: 350, height: 52)
                }
                .background(Color.purpleColor)
                .cornerRadius(12)

            
        }
        .padding()
        .background(Color.welcomeBackground)
        .ignoresSafeArea()
    }
}

struct welcomeView_Previews: PreviewProvider {
    static var previews: some View {
        welcomeView(routine: .constant(RoutineInfo.datas))
    }
}
