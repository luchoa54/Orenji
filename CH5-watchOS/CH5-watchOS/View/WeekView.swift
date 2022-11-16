//
//  WeekView.swift
//  CH5-watchOS
//
//  Created by Luciano Uchoa on 16/11/22.
//

import SwiftUI

struct WeekView: View {
    
    @State var checkState: Bool = false
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Repetição")
                .fontWeight(.bold)
            HStack(spacing: 10) {
                CircleFieldView(name: "S")
                CircleFieldView(name: "T")
                CircleFieldView(name: "Q")
                CircleFieldView(name: "Q")
                CircleFieldView(name: "S")
                CircleFieldView(name: "S")
                CircleFieldView(name: "D")
            }
        }
        .padding()
        .padding(.trailing)
        .frame(width: 350, height: 100)
            .background(Color.white)
            .cornerRadius(12)
    }
}

struct CircleFieldView: View {
    
    @State var checkState: Bool = false
    @State var name: String
    
    var body: some View {
        
        Button(action:{
            //1. Save state
            self.checkState = !self.checkState
            print("State S : \(self.checkState)")
        }) {
            HStack {
                Circle()
                    .fill(self.checkState ? Color.purpleColor : Color.gray)
                    .overlay(
                        Text("\(name)")
                            .foregroundColor(self.checkState ? Color.white : Color.black)
                    )
            }
        }
    }
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView()
    }
}
