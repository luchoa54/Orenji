//
//  OrangeView.swift
//  CH5-watchOS Watch App
//
//  Created by Luciano Uchoa on 10/11/22.
//

import SwiftUI

struct OrangeView: View {
    
    @State var shiftTitle: String
    @AppStorage("Orange")  var orangeImage = "mainsad"
    @AppStorage("fezRotina") var fezRotina = false
    
    var body: some View {
        VStack {
            Image("\(orangeImage)")
                .resizable()
                .frame(width: 90, height: 104)
                .padding()
            Text("Próxima rotina \nmarcada para \(shiftTitle)")
                .multilineTextAlignment(.center)
                .font(.custom("SF Pro Display", fixedSize: 13))
                .frame(height: 32)
        }.onAppear(){
            if fezRotina == false {
                orangeImage = "mainsad"
            }else {
                orangeImage = "mainhappy"
            }
        }.navigationBarHidden(true)
    }
}

struct OrangeView_Previews: PreviewProvider {
    static var previews: some View {
        OrangeView(shiftTitle: "Manhã")
    }
}
