//
//  WeekView.swift
//  CH5-watchOS
//
//  Created by Luciano Uchoa on 16/11/22.
//

import SwiftUI

struct WeekView: View {
    @Binding var data : RoutineInfo.Data
    @State var checkState: Bool = false
    
    var body: some View {
        VStack(alignment: .leading){
            HStack() {
                CircleFieldView(checkState: $data.weekStatus[0], name: "S")
                CircleFieldView(checkState: $data.weekStatus[1],name: "T")
                CircleFieldView(checkState: $data.weekStatus[2],name: "Q")
                CircleFieldView(checkState: $data.weekStatus[3],name: "Q")
                CircleFieldView(checkState: $data.weekStatus[4],name: "S")
                CircleFieldView(checkState: $data.weekStatus[5],name: "S")
                CircleFieldView(checkState: $data.weekStatus[6],name: "D")
            }
        }
            .cornerRadius(12)
    }
}

struct CircleFieldView: View {
    
    @Binding var checkState: Bool
    @State var name: String
    
    var body: some View {
        
        Button(action:{
            //1. Save state
            self.checkState = !self.checkState
            print("State S : \(self.checkState)")
        }) {
            HStack {
                Circle()
                    .fill(self.checkState ? Color.purpleColor : Color.init("CircleRepetitionColor"))
                    .overlay(
                        Text("\(name)")
                            .foregroundColor(self.checkState ? Color.white : Color.init("circleLabel"))
                    )
            }
        }
    }
}

