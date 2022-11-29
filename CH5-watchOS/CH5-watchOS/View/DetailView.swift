//
//  DetailView.swift
//  CH5-watchOS
//
//  Created by Luciano Uchoa on 21/11/22.
//

import SwiftUI

struct DetailView: View {
    @Binding var rotinas: RoutineInfo
    
    @State private var data = RoutineInfo.Data()
    @State private var isPresentingEditView = false
    
    var body: some View {
        List{
            Section(header: Text("Titulo da Rotina")){
                Text("\(rotinas.shift)")
            }
            Section(header: Text("Quantidade de Passos")){
                Text("\(rotinas.numberSteps)" as String)
            }
            Section(header: Text("Status da notificação")){
                if(rotinas.notificationStatus){
                    HStack(spacing: 10){
                        Image(systemName: "info.circle")
                            .foregroundColor(Color.orangeText)
                        Text("Ativada")
                            .font(.system(size: 15))
                            .foregroundColor(Color.orangeText)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                    }
                }
                else{
                    HStack(spacing: 10){
                        Image(systemName: "info.circle")
                            .foregroundColor(Color.orangeText)
                        Text("Desativada")
                            .font(.system(size: 15))
                            .foregroundColor(Color.orangeText)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                    }
                }
            }
            Section(header: Text("Semana")){
                StaticWeekView(checkState: $rotinas.weekStatus)
            }
        }.navigationTitle(rotinas.shift)
            .toolbar {
                Button("Edit") {
                    isPresentingEditView = true
                    data = rotinas.data
                }
            }
            .sheet(isPresented: $isPresentingEditView) {
                NavigationView {
                    DetailEditView(data: $data)
                        .navigationTitle(rotinas.shift)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    isPresentingEditView = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Done") {
                                    isPresentingEditView = false
                                    rotinas.update(from: data)
                                }
                            }
                        }
                }
            }
    }
}

struct StaticWeekView: View{
    @Binding var checkState: [Bool]
    
    var body: some View{
        HStack {
            Circle()
                .fill(self.checkState[0] ? Color.purpleColor : Color.init("CircleRepetitionColor"))
                .overlay(
                    Text("S")
                        .foregroundColor(self.checkState[0] ? Color.white : Color.init("circleLabel"))
                )
            Circle()
                .fill(self.checkState[1] ? Color.purpleColor : Color.init("CircleRepetitionColor"))
                .overlay(
                    Text("T")
                        .foregroundColor(self.checkState[1] ? Color.white : Color.init("circleLabel"))
                )
            Circle()
                .fill(self.checkState[2] ? Color.purpleColor : Color.init("CircleRepetitionColor"))
                .overlay(
                    Text("Q")
                        .foregroundColor(self.checkState[2] ? Color.white : Color.init("circleLabel"))
                )
            Circle()
                .fill(self.checkState[3] ? Color.purpleColor : Color.init("CircleRepetitionColor"))
                .overlay(
                    Text("Q")
                        .foregroundColor(self.checkState[3] ? Color.white : Color.init("circleLabel"))
                )
            Circle()
                .fill(self.checkState[4] ? Color.purpleColor : Color.init("CircleRepetitionColor"))
                .overlay(
                    Text("S")
                        .foregroundColor(self.checkState[4] ? Color.white : Color.init("circleLabel"))
                )
            Circle()
                .fill(self.checkState[5] ? Color.purpleColor : Color.init("CircleRepetitionColor"))
                .overlay(
                    Text("S")
                        .foregroundColor(self.checkState[5] ? Color.white : Color.init("circleLabel"))
                )
            Circle()
                .fill(self.checkState[6] ? Color.purpleColor : Color.init("CircleRepetitionColor"))
                .overlay(
                    Text("D")
                        .foregroundColor(self.checkState[6] ? Color.white : Color.init("circleLabel"))
                )
            
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(rotinas: .constant(RoutineInfo.datas[0]))
    }
}
