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
                    .foregroundColor(.white)
        
                Text("/  \(routine.numberSteps)")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.grayTextColor)
            }
            .padding([.horizontal], 16)
            .padding([.vertical], 8)
            .background(Color.grayColor)
            .cornerRadius(8)
                        
            ZStack {
                VStack (spacing: 12){
                    Text("\(routine.titleStep[currentStep - 1])")
                        .foregroundColor(.white)
                        .font(.callout)
                        .fontWeight(.bold)
                        //.padding([.bottom], 12)
                    Text("\(routine.descriptionStep[currentStep - 1])")
                        .foregroundColor(.descriptionForeground)
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

            if(self.currentStep == routine.numberSteps) {
                NavigationLink(destination: FinalStepView()) {
                    Text("Finalizar")
                        .foregroundColor(.grayColor)
                        .font(.system(size: 17))
                        .padding([.horizontal], 148)
                        .padding([.vertical], 14)
                }
                .background(Color.greenColor)
                .cornerRadius(12)
            }
            else {
                NavigationLink(destination: StepByStepView(routine: $routine, currentStep: self.currentStep + 1)) {
                    Text("Iniciar")
                        .foregroundColor(.grayColor)
                        .font(.system(size: 17))
                        .padding([.horizontal], 148)
                        .padding([.vertical], 14)
                }
                .background(Color.greenColor)
                .cornerRadius(12)
            }
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
