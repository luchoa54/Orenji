//
//  ContentView.swift
//  CH5-watchOS
//
//  Created by Luciano Uchoa on 07/11/22.
//

import SwiftUI

struct ContentView: View {
    @Binding var routine: [RoutineInfo]
    
    var body: some View {
        VStack {
            HStack {
                Text("Vamos cuidar da sua pele?")
                    .font(.system(size: 24))
                    .fontWeight(.black)
                    .foregroundColor(.titleColor)
                    //.padding([.horizontal], 20)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "plus.app.fill")
                        .resizable()
                        .foregroundColor(.purpleColor)
                        .frame(width: 48, height: 44)
                        //.padding([.horizontal], 31)

                }

            }
            
            Spacer()
            
            Image("assetProvisorio2")
            
            Spacer()
            
            Text("Suas atividades")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(.titleColor)
                .padding([.trailing], 204)
            
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                
                HStack {
                    ForEach($routine) { $routine in
                        CardView(routine: $routine)
                    }
                }
            })
        }
        .padding()
        .background(Color.gray.opacity(0.18))
        //.ignoresSafeArea()
        .navigationBarBackButtonHidden()
        //.navigationTitle("App")
        //.navigationBarTitleDisplayMode(.inline)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(routine: .constant(RoutineInfo.datas))
    }
}
