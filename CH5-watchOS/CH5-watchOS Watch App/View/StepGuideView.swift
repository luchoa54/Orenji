//
//  ContentView.swift
//  CH5-watchOS Watch App
//
//  Created by Luciano Uchoa on 07/11/22.
//

import SwiftUI

struct StepGuideView: View {
    
    @State var passoAtual: Int = 1
    @State var backButtonStatus: Bool = false
    @Binding var rootIsActive : Bool
    @Binding var routine : RoutineData
    
    var body: some View {
        VStack {
            Spacer(minLength: 25)
            Rectangle()
                .frame(width: 67, height: 19)
                .foregroundColor(.backgroundColor)
                .cornerRadius(8)
                .overlay(
                    Text("Passo \(passoAtual) / \(routine.numberSteps)")
                        .font(.system(size: 11, weight: .semibold))
                )
            Text("\(routine.titleStep[passoAtual - 1])")
                .font(.system(size: 11,weight: .semibold))
            TabView{
                Image("\(stepImage(imageName: routine.titleStep[passoAtual - 1]))")
                    .resizable()
                    .frame(width: 80, height: 72)
                
                Text("\(routine.descriptionStep[passoAtual - 1])")
                    .font(.system(size: 11))
                    .multilineTextAlignment(.center)
                
            }.frame(width: 80, height: 90)
                .tabViewStyle(CarouselTabViewStyle())
            
            NavigationLink(destination: TimerView(passoAtual: $passoAtual, rootIsActive: self.$rootIsActive, routine: $routine)){
                Text("Iniciar")
            }.background(Color.purpleColor)
                .cornerRadius(50)
                .foregroundColor(Color.black)
        }.navigationTitle("Manhã")
    }
    
    func stepImage(imageName: String) -> String{
        switch imageName {
        case "Limpeza do rosto":
            return "wash"
        case "Hidratação":
            return "sunscreen"
        case "Protetor solar":
            return "sunscreen"
        case "Vitamina C":
            return "vitC"
        case "Serum":
            return "vitC"
        default:
            return "wash"
        }
    }
}


struct StepGuideView_Previews: PreviewProvider {
    static var previews: some View {
        StepGuideView(rootIsActive: .constant(false), routine: .constant(RoutineData.datas[0]))
    }
}


