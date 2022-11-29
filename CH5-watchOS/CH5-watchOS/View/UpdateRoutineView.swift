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
    //@EnvironmentObject var appState: AppState
    //@Binding var routine: RoutineInfo
    
    var body: some View {
        
        VStack{
            Text("Deseja alterar a sua rotina?")
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
