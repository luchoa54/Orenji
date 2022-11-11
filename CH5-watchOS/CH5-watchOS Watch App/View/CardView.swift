//
//  CardView.swift
//  CH5-watchOS Watch App
//
//  Created by Luciano Uchoa on 09/11/22.
//

import SwiftUI

struct CardView: View {
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text("Manhã")
                    .font(.headline)
                Text("3 passos")
                    .font(.caption)
            }
            Spacer()
            Image(systemName: "play.circle.fill")
                .foregroundColor(Color.purpleColor)
            
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
