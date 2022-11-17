//
//  RegistrationView.swift
//  CH5-watchOS
//
//  Created by Luciano Uchoa on 16/11/22.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var bool = true
    
    var body: some View {
        
        VStack{
            Text("Vamos cadastrar a sua rotina")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color.init("labelColor"))
                .padding()
            Form {
                Section {
                    Image("Afternoon")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 350, height: 64)
                    DisclosureGroup {
                        CheckboxFieldView(name: "Limpeza")
                        CheckboxFieldView(name: "Hidratação")
                        CheckboxFieldView(name: "Protetor Solar")
                        CheckboxFieldView(name: "Vitamina C")
                        CheckboxFieldView(name: "Máscara Facial")
                        WeekView().buttonStyle(.borderless)
                            .padding(.trailing)
                        Toggle("Habilitar Rotina", isOn: $bool)
                            .tint(Color.purpleColor)
                    } label: {
                        Image(systemName: "sun.max")
                        Text("Manhã")
                            .font(.headline)
                    }
                }
                Section {
                    Image("Morning")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 350, height: 64)
                    DisclosureGroup {
                        CheckboxFieldView(name: "Limpeza")
                        CheckboxFieldView(name: "Hidratação")
                        CheckboxFieldView(name: "Protetor Solar")
                        CheckboxFieldView(name: "Vitamina C")
                        CheckboxFieldView(name: "Máscara Facial")
                        WeekView().buttonStyle(.borderless)
                            .padding(.trailing)
                        Toggle("Habilitar Rotina", isOn: $bool)
                            .tint(Color.purpleColor)
                    } label: {
                        Image(systemName: "sun.and.horizon")
                        Text("Tarde")
                            .font(.headline)
                    }
                }
                Section {
                    Image("Night")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 350, height: 64)
                    DisclosureGroup {
                        CheckboxFieldView(name: "Limpeza")
                        CheckboxFieldView(name: "Hidratação")
                        CheckboxFieldView(name: "Protetor Solar")
                        CheckboxFieldView(name: "Vitamina C")
                        CheckboxFieldView(name: "Máscara Facial")
                        WeekView().buttonStyle(.borderless)
                            .padding(.trailing)
                        Toggle("Habilitar rotina", isOn: $bool)
                            .tint(Color.purpleColor)
                    } label: {
                        Image(systemName: "moon")
                        Text("Noite")
                            .font(.headline)
                    }
                }
            }
            Button("Concluído"){
                print("Concluído")
            }.frame(width: 350, height: 52)
                .background(Color.purpleColor)
                .cornerRadius(12)
                .foregroundColor(Color.white)
        }.scrollContentBackground(.hidden)
            .background(Color.init("backgroundListColor"))
            .formStyle(.automatic )
    }
}

struct CheckboxFieldView: View {
    
    @State var checkState: Bool = false
    @State var name: String
    
    var body: some View {
        
        Button(action:{
            //1. Save state
            self.checkState = !self.checkState
            print("State : \(self.checkState)")
        }) {
            HStack {
                //2. Will update according to state
                Image(self.checkState ? "Selection_on" : "Selection_off")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("\(name)")
                    .foregroundColor(Color.init("blackColor"))
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
