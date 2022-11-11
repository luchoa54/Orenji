//
//  StepByStepView.swift
//  CH5-watchOS
//
//  Created by Ana Kiara Medeiros Braga on 07/11/22.
//

import SwiftUI

struct StepByStepView: View {
    //let routine: RoutineInfo
    @Binding var routine: RoutineInfo
    @State var currentStep: Int = 1

    var body: some View {
        
        VStack {
            HStack {
                StepTitle(text: "Passo \(currentStep)")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.textCurrentStep)
        
                Text("/ \(routine.numberSteps)")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.textNextStep)
            }
            .padding([.horizontal], 16)
            .padding([.vertical], 8)
            .background(Color.stepTextBackground)
            .cornerRadius(8)
                        
            ZStack {
                VStack (spacing: 12){
                    Text("\(routine.titleStep[currentStep - 1])")
                        .foregroundColor(.titleColor)
                        .font(.callout)
                        .fontWeight(.bold)
                        //.padding([.bottom], 12)
                    Text("\(routine.descriptionStep[currentStep - 1])")
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
                NavigationLink(destination: TimerStepView(routine: $routine, currentStep: self.$currentStep)) {
                    Text("Iniciar")
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

struct StepByStepView_Previews: PreviewProvider {
    static var routine = RoutineInfo.datas[0]
    static var previews: some View {
        StepByStepView(routine: .constant(RoutineInfo.datas[0]))
    }
}
