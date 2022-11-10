//
//  ViewController.swift
//  CH5-watchOS Watch App
//
//  Created by Luciano Uchoa on 08/11/22.
//

import SwiftUI

struct ListView: View {
    @Binding var skincare: [DailySkinCare]
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                Text("Suas rotinas")
                List{
                    ForEach($skincare) { $skincare in
                        NavigationLink(destination: ContentView(skincare: $skincare)) {
                            CardView(skincare: skincare)
                                .frame(height: 74)
                        }
                    }
                }.listStyle(CarouselListStyle())
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(skincare: .constant(DailySkinCare.sampleData))
    }
}

