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
        VStack{
            if tempo >= "06:00" && tempo < "06:30" {
                ListView()
            }else {
                OrangeView()
            }
        }.onReceive(timer){ timer in
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
