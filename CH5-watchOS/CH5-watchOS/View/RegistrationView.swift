//
//  RegistrationView.swift
//  CH5-watchOS
//
//  Created by Luciano Uchoa on 16/11/22.
//

import SwiftUI

struct RegistrationView: View {
    @Binding var routine: [RoutineInfo]
    @State private var bool = true
    //@EnvironmentObject var appState: AppState
    //@Binding var routine: RoutineInfo
    @State private var isCreatePresented = true

    var body: some View {
        
        VStack{
            Text("Vamos cadastrar a sua rotina")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color.init("labelColor"))
                .padding()
            Spacer()
            VStack{
                ForEach($routine) { $routine in
                    NavigationLink(destination: DetailView(rotinas: $routine)){
                        CardListView(routine: $routine)
                    }
                }
            }
            Spacer()
            Button {
                //
            } label: {
                NavigationLink(destination: HomeView(routine: $routine, shift: 0)) {
                        Text("Concluído")
                            .font(.system(size: 17))
                            .frame(width: 350, height: 52)
                    
                }.isDetailLink(false)
                    .frame(width: 350, height: 52)
                    .background(Color.purpleColor)
                    .cornerRadius(12)
                    .foregroundColor(Color.white)
            }
            
        }
            .background(Color.init("cardBackground"))
            .navigationBarBackButtonHidden(true)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(routine: .constant(RoutineInfo.datas))
    }
}
