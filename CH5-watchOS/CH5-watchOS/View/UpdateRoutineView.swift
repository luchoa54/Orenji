//
//  UpdateRoutineView.swift
//  Orenji
//
//  Created by Luciano Uchoa on 29/11/22.
//

import SwiftUI

struct UpdateRoutineView: View {
    @Binding var routine: [RoutineInfo]
    @State private var bool = true
    @AppStorage("fezRotina") var fezRotina = false
    @AppStorage("laranjito") var orangeName = ""
    @State private var nomePersonagem = "Laranjito"
    //@EnvironmentObject var appState: AppState
    //@Binding var routine: RoutineInfo
    
    var body: some View {
        
        VStack{
            Text("Editar")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color.init("labelColor"))
                .padding()
            VStack (spacing: 10){
                Text("Nome do Personagem")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                    .textCase(.uppercase)
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("Qual meu novo nome?", text: $orangeName)
                    .padding()
                    .foregroundColor(.titleColor)
                    .background(Color.orangeNameBackground)
                    .cornerRadius(12)
            }.padding()
            Text("Rotinas")
                .font(.system(size: 15))
                .foregroundColor(.gray)
                .textCase(.uppercase)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            VStack{
                ForEach($routine) { $routine in
                    NavigationLink(destination: DetailView(rotinas: $routine)){
                        CardListView(routine: $routine)
                    }
                }
            }
            Spacer()
        }.onAppear(){
            fezRotina = false
        }
        .background(Color.init("cardBackground"))
        .navigationBarBackButtonHidden(true)
    }
}

struct UpdateRoutineView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateRoutineView(routine: .constant(RoutineInfo.datas))
    }
}
