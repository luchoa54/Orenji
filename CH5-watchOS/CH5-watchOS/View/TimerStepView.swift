//
//  TimerStepView.swift
//  CH5-watchOS
//
//  Created by Ana Kiara Medeiros Braga on 10/11/22.
//

import SwiftUI

let timer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

struct TimerStepView: View {
    @State var timerRunning = false
    @State var counter: Int = 0
    @State var indexStep: Int = 0
    @Binding var routine: RoutineInfo
    @State var currentStep: Int = 1
    @Binding var rootIsActive : Bool
    @AppStorage("rotina concluida") var completedRoutine = false
    
    var body: some View {
        VStack{
            HStack {
                Text("Passo \(currentStep)")
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
                    Text("\(routine.titleStep[indexStep])")
                        .foregroundColor(.titleColor)
                        .font(.callout)
                        .fontWeight(.bold)
                    //.padding([.bottom], 12)
                    Text("\(routine.descriptionStep[indexStep])")
                        .foregroundColor(.descriptionColor)
                        .multilineTextAlignment(.center)
                        .font(.body)
                }
                .padding([.all], 16)
            }
            .padding([.horizontal], 40)
            ZStack{
                Circle()
                    .fill(Color.clear)
                    .frame(width: 272, height: 272, alignment: .center)
                    .overlay(
                        Circle().stroke(Color.elipse2Timer, lineWidth: 25)
                    )
                    .padding([.horizontal], 77)
                
                Circle()
                    .fill(Color.clear)
                    .overlay(
                        Circle().trim(from:0, to: progress())
                            .stroke(
                                style: StrokeStyle(
                                    lineWidth: 25,
                                    lineCap: .round,
                                    lineJoin:.round
                                )
                            )
                            .foregroundColor(
                                (timerRunning ? Color.purpleColor : Color.elipsePaused)
                            ).animation(
                                .easeInOut(duration: 0.2)
                            )
                    )
                    .padding([.horizontal], 77)
                
                
                Clock(counter: counter, countTo: routine.timeStep[indexStep], image: routine.imagesSteps[indexStep])
            }
            .padding([.top], 30)
            
            Spacer()
            
            ZStack{
                if !completed(){
                    if timerRunning == false {
                        VStack {
                            Button(action: {
                                self.timerRunning.toggle()
                            }) {
                                Text("Iniciar")
                                    .foregroundColor(Color.white)
                                    .frame(width: 350, height: 52)
                                    .fontWeight(.semibold)
                                    
                            }.foregroundColor(.textButtonStep)
                                .font(.system(size: 17))
                                .frame(width: 350, height: 52)
                                .background(Color.purpleColor)
                                .cornerRadius(12)
                                
                            
                            if(self.currentStep == routine.numberSteps){
                                NavigationLink(destination: FinalStepView(routine: $routine, shouldPopToRootView: self.$rootIsActive)) {
                                    Text("Pular")
                                        .foregroundColor(Color.purpleColor)
                                        .frame(width: 350, height: 52)
                                        .fontWeight(.semibold)
                                        .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(lineWidth: 5)
                                            .frame(width: 350, height: 52)
                                            .foregroundColor(Color.purpleColor)
                                        )
                                    
                                }.foregroundColor(.textButtonStep)
                                    .font(.system(size: 17))
                                    .frame(width: 350, height: 52)
                                    .background(Color.white)
                                    .cornerRadius(12)
                            }else {
                                NavigationLink(destination: TimerStepView(indexStep: self.indexStep,routine: $routine, currentStep: self.currentStep + 1, rootIsActive: self.$rootIsActive)){
                                    Text("Pular")
                                        .foregroundColor(Color.purpleColor)
                                        .frame(width: 350, height: 52)
                                        .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(lineWidth: 5)
                                            .frame(width: 350, height: 52)
                                            .foregroundColor(Color.purpleColor)
                                        )
                                    
                                }.foregroundColor(.textButtonStep)
                                    .font(.system(size: 17))
                                    .fontWeight(.semibold)
                                    .frame(width: 350, height: 52)
                                    .background(Color.white)
                                    .cornerRadius(12)
                            }
                        }
                    }else {
                        VStack{
                            NavigationLink(destination: TimerStepView(indexStep: self.indexStep + 1,routine: $routine, currentStep: self.currentStep + 1, rootIsActive: self.$rootIsActive)) {
                                Text("Pular")
                                    .foregroundColor(Color.white)
                                    .frame(width: 350, height: 52)
                                    .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(lineWidth: 5)
                                        .frame(width: 350, height: 52)
                                        .foregroundColor(Color.purpleColor)
                                    )
                                
                            }.foregroundColor(.textButtonStep)
                                .font(.system(size: 17))
                                .fontWeight(.semibold)
                                .frame(width: 350, height: 52)
                                .background(Color.purpleColor)
                                .cornerRadius(12)
                            Button(action: {
                                self.timerRunning.toggle()
                            }) {
                                Text("Pausar")
                                    .foregroundColor(.purpleColor)
                                    .font(.system(size: 17))
                                    .fontWeight(.semibold)
                                    .frame(width: 350, height: 52)
                                    .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(lineWidth: 5)
                                        .frame(width: 350, height: 52)
                                        .foregroundColor(Color.purpleColor)
                                    )
                            }
                            .background(Color.white)
                            .cornerRadius(12)
                        }
                    }
                }
                else {
                    if(self.currentStep == routine.numberSteps){
                        
                        NavigationLink(destination: FinalStepView(routine: $routine, shouldPopToRootView: self.$rootIsActive)) {
                            Text("Finish")
                                .foregroundColor(.textButtonStep)
                                .font(.system(size: 17))
                                .fontWeight(.semibold)
                                .frame(width: 350, height: 52)
                        }
                        .background(Color.purpleColor)
                        .cornerRadius(12)
                    }
                    else {
                        NavigationLink(destination: TimerStepView(indexStep: self.indexStep + 1,routine: $routine, currentStep: self.currentStep + 1, rootIsActive: self.$rootIsActive)) {
                            Text("Finish")
                                .foregroundColor(.textButtonStep)
                                .fontWeight(.semibold)
                                .font(.system(size: 17))
                                .frame(width: 350, height: 52)
                        }
                        .background(Color.purpleColor)
                        .cornerRadius(12)
                    }
                }
            }
            
        }.onReceive(timer) { time in
            if (self.counter < routine.timeStep[indexStep] && timerRunning) {
                self.counter += 1
            }
        }.onAppear(){
            nextStep()
        }
        .padding()
    }
    
    func nextStep(){
        var stepFound: Bool = false
        
        while stepFound == false {
            if(routine.stepStatus[indexStep] == false){
                indexStep += 1
            }else{
                stepFound = true
            }
        }
    }
    
    func completed() -> Bool {
        return progress() == 1
    }
    
    func progress() -> CGFloat {
        return (CGFloat(counter) / CGFloat(routine.timeStep[indexStep]))
    }
}

struct Clock: View {
    var counter: Int
    var countTo: Int
    var image: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .frame(width: 175, height: 158, alignment: .center)
        }
    }
    
    func counterToMinutes() -> String {
        let currentTime = countTo - counter
        let seconds = currentTime % 60
        let minutes = Int(currentTime / 60)
        
        return "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
    }
}

struct TimerStepView_Previews: PreviewProvider {
    static var previews: some View {
        TimerStepView(indexStep: 1, routine: .constant(RoutineInfo.datas[0]), currentStep: 1, rootIsActive: .constant(false))
        //        TimerStepView(routine: .constant(RoutineInfo.datas[0]), currentStep: .constant(1))
    }
}
