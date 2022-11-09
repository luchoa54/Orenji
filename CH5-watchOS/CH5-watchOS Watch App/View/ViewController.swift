//
//  ViewController.swift
//  CH5-watchOS Watch App
//
//  Created by Luciano Uchoa on 08/11/22.
//

import SwiftUI

struct ViewController: View {
    @State private var skincare = DailySkinCare.sampleData
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                Text("Suas rotinas")
                ScrollView(.vertical, showsIndicators: false){
                    LazyVStack{
                        ForEach($skincare) { $skincare in
                            NavigationLink(destination: ContentView(skincare: $skincare)) {
                                CardView(skincare: skincare)
                            }
                        }
                        
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

