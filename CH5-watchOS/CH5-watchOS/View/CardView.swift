//
//  CardView.swift
//  CH5-watchOS
//
//  Created by Ana Kiara Medeiros Braga on 11/11/22.
//

import SwiftUI

struct CardView: View {
    @Binding var routine: RoutineInfo
    var body: some View {
        VStack {
            ZStack {
                Image("\(routine.imageShift)")
                    .resizable()
                    .frame(width: 264, height: 120)
                
                ZStack {
                    Rectangle()
                        .frame(width: 264, height: 56)
                    .foregroundColor(.white)
                    
                    HStack {
                        VStack (alignment: .leading) {
                            Text("\(routine.shift)")
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                                .foregroundColor(.titleCardColor)
                            Text("Possui \(routine.numberSteps) passos")
                                .font(.system(size: 13))
                                .foregroundColor(.descriptionCardColor)
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: StepByStepView(routine: $routine), label: {
                            Image(systemName: "play.circle.fill")
                                .resizable()
                                .frame(width: 32, height: 32)
                                .foregroundColor(.purpleColor)
                        })
                        
                    }
                    .frame(width: 240, height: 40)
                }
                .padding([.top], 64)
            }
            
        }
        .cornerRadius(12)
        .padding(.bottom)
//        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.white, lineWidth:1))
//        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(routine: .constant(RoutineInfo.datas[0]))
    }
}
