//
//  StepButton.swift
//  CH5-watchOS
//
//  Created by Ana Kiara Medeiros Braga on 07/11/22.
//

import Foundation
import SwiftUI

struct StepButton: View {
    var text: String
    var action: () -> Void
    var body: some View {
        
        Button(text, action: action)
               
                //.font(.system(size: 16))
    //            .foregroundColor(.white)
    //            .padding([.all], 20)
    //            .background(Color.buttonBackground)
    //            .cornerRadius(12)

        .tint(Color.buttonBackground)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle(radius: 12))
        .controlSize(.large)

    }
}

//struct StepButton_Previews: PreviewProvider {
//    static var previews: some View {
//        StepButton(text: "hello")
//    }
//}
