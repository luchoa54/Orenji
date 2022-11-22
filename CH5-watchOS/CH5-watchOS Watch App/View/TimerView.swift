//
//  StepView.swift
//  CH5-watchOS Watch App
//
//  Created by Luciano Uchoa on 07/11/22.
//

import SwiftUI

struct TimerView: View {
    @State var counter: Int = 0
    @State private var timerStarted = false
    @Binding var passoAtual: Int
    @Binding var rootIsActive : Bool
    @Binding var routine : RoutineData
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack (spacing: 25){
                Spacer(minLength: 10)
                ZStack {
                    TrackView()
                    Label(counter: $counter, countTo: 1)
                    Outline(countTo: 1, counter: $counter, timePaused: $timerStarted)
                }
                ZStack{
                    if !completed(){
                        if timerStarted == false{
                            Button(action: {
                                self.timerStarted.toggle()
                            }) {
                                Text("Iniciar")
                                    .foregroundColor(Color.black)
                            }.background(Color.purpleColor)
                                .cornerRadius(50)
                        }else {
                            Button(action: {
                                self.timerStarted.toggle()
                            }) {
                                Text("Pausar")
                                    .foregroundColor(Color.white)
                            }.background(Color.backgroundColor)
                                .cornerRadius(50)
                        }
                    }else {
                        if(self.passoAtual == routine.numberSteps){
                            NavigationLink(destination: FinishView(shouldPopToRootView: self.$rootIsActive)) {
                                Text("Finish")
                                    .foregroundColor(Color.black)
                                
                            }.background(Color.purpleColor)
                                .cornerRadius(50)
                        }else {
                            NavigationLink(destination: StepGuideView( passoAtual: self.passoAtual + 1, rootIsActive: self.$rootIsActive, routine: $routine)) {
                                Text("Finalizar")
                                    .foregroundColor(Color.black)
                                
                            }.background(Color.purpleColor)
                                .cornerRadius(50)
                        }
                    }
                }
            }
        }.onReceive(timer) { timer in
            if self.counter < 1 && timerStarted != false{
                self.counter += 1
            }
        }.navigationTitle("Limpeza")
    }
    
    func completed() -> Bool {
        return counter / 1 == 1
    }
}

struct Label: View {
    @Binding var counter: Int
    @State var countTo: Int
    
    var body: some View {
        ZStack {
            Text(counterToMinutes())
                .font(.system(size: 25))
                .fontWeight(.heavy)
                
        }
    }
    
    func counterToMinutes() -> String {
            let currentTime = countTo - counter
            let seconds = currentTime % 60
            let minutes = Int(currentTime / 60)
             
            return "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
        }
}

struct Outline: View {
   
    @State var countTo: Int
    @Binding var counter: Int
    @Binding var timePaused: Bool
    var pauseColor: [Color] = [Color.pausedColor]
    var runColor: [Color] = [Color.purpleColor]
    
    var body: some View{
        ZStack{
            if timePaused == false {
                Circle()
                    .fill(Color.clear)
                    .frame(width: 90, height: 90)
                    .overlay(
                        Circle()
                            .trim(from: 0, to: progress())
                            .stroke(style: StrokeStyle(lineWidth: 10,lineCap: .round,lineJoin: .round))
                            .fill(AngularGradient(gradient: .init(colors: pauseColor),center: .center, startAngle: .zero, endAngle: .init(degrees: 360)))
                    ).animation(.spring(response: 0.2, dampingFraction: 1.0, blendDuration: 1.0), value: UUID())
            }else {
                Circle()
                    .fill(Color.clear)
                    .frame(width: 90, height: 90)
                    .overlay(
                        Circle()
                            .trim(from: 0, to: progress())
                            .stroke(style: StrokeStyle(lineWidth: 10,lineCap: .round,lineJoin: .round))
                            .fill(AngularGradient(gradient: .init(colors: runColor),center: .center, startAngle: .zero, endAngle: .init(degrees: 360)))
                    ).animation(.spring(response: 0.2, dampingFraction: 1.0, blendDuration: 1.0), value: UUID())
            }
        }
    }
    
    func progress() -> CGFloat {
            return (CGFloat(counter) / CGFloat(countTo))
        }
}

struct TrackView: View {
    var colors: [Color] = [Color.timerColor]
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.clear)
                .frame(width: 90, height: 90)
                .overlay(
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 10))
                        .fill(AngularGradient(gradient: .init(colors: colors), center: .leading))
                )
        }
    }
}

struct Pulsation: View {
    @State private var pulsate = false
    var colors: [Color] = [Color.gray]
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.pulseColor)
                .frame(width: 90, height: 90)
                .scaleEffect(pulsate ? 1.4: 1.1)
                .animation(Animation.easeInOut(duration: 1.1).repeatForever(autoreverses: true), value: UUID())
                .onAppear {
                    self.pulsate.toggle()
                }
        }
    }
}

struct Clock: View {
    var counter: Int
    var countTo: Int
    
    var body: some View {
        VStack {
            Text(counterToMinutes())
                .font(.system(size: 60))
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

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(passoAtual: .constant(1), rootIsActive: .constant(false), routine: .constant(RoutineData.datas[0]))
    }
}
