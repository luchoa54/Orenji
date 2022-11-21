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
    @State var timerRunning = true
    @State var counter: Int = 0
    @Binding var indexStep: Int
    @Binding var routine: RoutineInfo
    @Binding var currentStep: Int
    @Binding var rootIsActive : Bool
    @AppStorage("rotina concluida") var completedRoutine = false
    
    var countTo: Int = 2 //4 minutes 120 - 2minutes
    
    var body: some View {
        VStack{
            ZStack{
                Circle()
                    .fill(Color.clear)
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
                
                
                Clock(counter: counter, countTo: countTo)
            }
            .padding([.top], 213)
            
            Spacer()
            
            ZStack{
                if !completed(){
                    if timerRunning == false {
                        Button(action: {
                            self.timerRunning.toggle()
                        }) {
                            Text("Retomar")
                                .foregroundColor(.textButtonStep)
                                .font(.system(size: 17))
                                .frame(width: 350, height: 52)
                        }
                        .background(Color.purpleColor)
                        .cornerRadius(12)
                    }else {
                        Button(action: {
                            self.timerRunning.toggle()
                        }) {
                            Text("Pausar")
                                .foregroundColor(.textButtonStep)
                                .font(.system(size: 17))
                                .frame(width: 350, height: 52)
                        }
                        .background(Color.buttonPause)
                        .cornerRadius(12)
                    }
                }
                else {
                    if(self.currentStep == routine.numberSteps){
                        
                        NavigationLink(destination: FinalStepView(routine: $routine, shouldPopToRootView: self.$rootIsActive)) {
                            Text("Finish")
                                .foregroundColor(.textButtonStep)
                                .font(.system(size: 17))
                                .frame(width: 350, height: 52)
                        }
                        .background(Color.purpleColor)
                        .cornerRadius(12)
                    }
                    else {
                        NavigationLink(destination: StepByStepView(routine: $routine, rootIsActive: self.$rootIsActive, currentStep: self.currentStep + 1, indexStep: self.indexStep)) {
                            Text("Finish")
                                .foregroundColor(.textButtonStep)
                                .font(.system(size: 17))
                                .frame(width: 350, height: 52)
                        }
                        .background(Color.purpleColor)
                        .cornerRadius(12)
                    }
                }
            }
            
        }.onReceive(timer) { time in
            if (self.counter < self.countTo && timerRunning) {
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
            if(routine.stepStatus[indexStep + 1] == false && indexStep < 4){
                self.indexStep += 1
            }else{
                if indexStep < 5 && routine.stepStatus[indexStep + 1] == true{
                    self.indexStep += 1
                }
                stepFound = true
            }
        }
    }
    
    func completed() -> Bool {
        return progress() == 1
    }
    
    func progress() -> CGFloat {
        return (CGFloat(counter) / CGFloat(countTo))
    }
}

struct Clock: View {
    var counter: Int
    var countTo: Int
    
    var body: some View {
        VStack {
            Text(counterToMinutes())
                .font(.title)
                .fontWeight(.black)
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
        TimerStepView(indexStep: .constant(1), routine: .constant(RoutineInfo.datas[0]), currentStep: .constant(1), rootIsActive: .constant(false))
        //        TimerStepView(routine: .constant(RoutineInfo.datas[0]), currentStep: .constant(1))
    }
}
