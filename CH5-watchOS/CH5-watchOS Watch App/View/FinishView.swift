//
//  FinishView.swift
//  CH5-watchOS Watch App
//
//  Created by Luciano Uchoa on 08/11/22.
//

import SwiftUI

struct FinishView: View {
    
    var body: some View {
        VStack {
            Text("Skincare Finalizada!")
            Spacer()
            Image("happy")
                .resizable()
                .frame(width: 82, height: 78.5, alignment: .center)
            Spacer()
            NavigationLink(destination: ViewController()
                .navigationTitle("App")
                .navigationBarTitleDisplayMode(.inline)
            ){
                Text("OK")
                    .foregroundColor(Color.black)
            }.background(Color.purpleColor)
                .cornerRadius(50)
            
        }.navigationTitle("Concluído")
            .edgesIgnoringSafeArea(.bottom)
    }
}

struct FinishView_Previews: PreviewProvider {
    static var previews: some View {
        FinishView()
    }
}
