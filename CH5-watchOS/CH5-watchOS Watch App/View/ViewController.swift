//
//  ViewController.swift
//  CH5-watchOS Watch App
//
//  Created by Luciano Uchoa on 10/11/22.
//

import SwiftUI

struct ViewController: View {
    
    @State var tempo: String = ""
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView{
            if tempo >= "06:00" && tempo < "23:59" {
                ListView()
            }else {
                OrangeView()
            }
        }.navigationBarBackButtonHidden(true)
        .onReceive(timer){ timer in
            tempo = getTime()
        }
        .onAppear(){
            tempo = getTime()
        }
    }
    
    func getTime() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let dateString = formatter.string(from: Date())
        return dateString
    }
    
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewController()
    }
}
