//
//  CardView.swift
//  CH5-watchOS Watch App
//
//  Created by Luciano Uchoa on 09/11/22.
//

import SwiftUI

struct CardView: View {
    let skincare: DailySkinCare
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text("\(skincare.turno)")
                    .font(.headline)
                Text("\(skincare.qtPassos) passos")
                    .font(.caption)
            }
            Spacer()
            Image(systemName: "play.circle.fill")
                .foregroundColor(Color.purpleColor)
            
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var skincare = DailySkinCare.sampleData[0]
    static var previews: some View {
        CardView(skincare: skincare)
    }
}
