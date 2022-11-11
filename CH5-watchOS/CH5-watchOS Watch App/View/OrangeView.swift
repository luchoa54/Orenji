//
//  OrangeView.swift
//  CH5-watchOS Watch App
//
//  Created by Luciano Uchoa on 10/11/22.
//

import SwiftUI

struct OrangeView: View {
    var body: some View {
        VStack {
            Image("mainsad")
                .resizable()
                .frame(width: 90, height: 104)
                .padding()
            Text("Próxima rotina \nmarcada para noite")
                .multilineTextAlignment(.center)
                .font(.custom("SF Pro Display", fixedSize: 13))
                .frame(height: 32)
        }
    }
}

struct OrangeView_Previews: PreviewProvider {
    static var previews: some View {
        OrangeView()
    }
}
