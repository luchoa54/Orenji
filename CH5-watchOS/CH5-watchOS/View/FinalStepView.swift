//
//  FinalStepView.swift
//  CH5-watchOS
//
//  Created by Ana Kiara Medeiros Braga on 10/11/22.
//

import SwiftUI

struct FinalStepView: View {
    //let routine: RoutineInfo
    @Binding var routine: RoutineInfo
    @State var currentStep: Int = 1

    var body: some View {
        
        VStack {
            
            Spacer()
                        
            ZStack {
                VStack (spacing: 12){
                    Text("Atividade finalizada!")
                        .foregroundColor(.titleColor)
                        .font(.callout)
                        .fontWeight(.bold)
                        //.padding([.bottom], 12)
                    Text("Parabéns, você cuidou muito bem da sua pele. Até a próxima!")
                        .foregroundColor(.descriptionColor)
                        .multilineTextAlignment(.center)
                        .font(.body)
                }
                .padding([.all], 16)
            }
            .padding([.horizontal], 40)
            //.padding([.bottom], 10)
            
            Image("assetProvisorio")
                //.padding([.bottom], 175)
            
            Spacer()

//            if(self.currentStep == routine.numberSteps) {
//                NavigationLink(destination: FinalStepView()) {
//                    Text("Finalizar")
//                        .foregroundColor(.textButtonStep)
//                        .font(.system(size: 17))
//                        .padding([.horizontal], 148)
//                        .padding([.vertical], 14)
//                }
//                .background(Color.purpleColor)
//                .cornerRadius(12)
//            }
//            else {
            NavigationLink(destination: ContentView(routine: .constant(RoutineInfo.datas))) {
                    Text("Finalizar")
                        .foregroundColor(.textButtonStep)
                        .font(.system(size: 17))
                        .frame(width: 350, height: 52)
                }
                .background(Color.purpleColor)
                .cornerRadius(12)
            //}
        }
        .navigationTitle("\(routine.shift)")
        .ignoresSafeArea(.all)
        .padding()
    }
}


struct FinalStepView_Previews: PreviewProvider {
    static var previews: some View {
        FinalStepView(routine: .constant(RoutineInfo.datas[0]))
    }
}
