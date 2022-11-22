//
//  CardView.swift
//  CH5-watchOS Watch App
//
//  Created by Luciano Uchoa on 09/11/22.
//

import SwiftUI

struct CardView: View {
    
    @Binding var routine: RoutineData
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text("\(routine.shift)")
                    .font(.headline)
                Text("\(routine.numberSteps) passos")
                    .font(.caption)
            }
            Spacer()
            Image(systemName: "play.circle.fill")
                .foregroundColor(Color.purpleColor)
            
        }
    }
}

struct CompleteCardView: View {
    
    @Binding var routine: RoutineData
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text("\(routine.shift)")
                    .font(.headline)
                Text("Rotina Concluída!")
                    .font(.caption)
                    .foregroundColor(Color.green)
            }
            Spacer()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(routine: .constant(RoutineData.datas[0]))
    }
}
