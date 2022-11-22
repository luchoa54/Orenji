//
//  ViewController.swift
//  CH5-watchOS Watch App
//
//  Created by Luciano Uchoa on 10/11/22.
//

import SwiftUI

struct ViewController: View {
    @State private var routine = RoutineData.datas
    @AppStorage("Orange")  var orangeImage = "mainsad"
    @AppStorage("fezRotina") var fezRotina = false
    @State var tempo: String = ""
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView{
            if  tempo >= "05:00" && tempo < "10:59"{
                ListView(routine: $routine, shift: 0)
            }else if tempo >= "13:00" && tempo < "16:59"{
                ListView(routine: $routine, shift: 1)
            }else if tempo >= "19:00" && tempo < "23:59"{
                ListView(routine: $routine, shift: 2)
            }
            else {
                OrangeView(shiftTitle: nextRoutine())
            }
        }.navigationBarBackButtonHidden(true)
        .onReceive(timer){ timer in
            tempo = getTime()
        }
        .onAppear(){
            tempo = getTime()
            fezRotina = false
            if tempo == "00:01"{
                orangeImage = "mainsad"
            }
        }
    }
    
    func getTime() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let dateString = formatter.string(from: Date())
        return dateString
    }
    
    func nextRoutine() -> String{
        
        if tempo >= "11:00" && tempo < "12:59" {
            return "Tarde"
        }else if tempo >= "17:00" && tempo < "18:59"{
            return "Noite"
        }else if tempo >= "00:00" && tempo < "04:59"{
            return "Manhã"
        }
        
        return "Amanhã"
    }
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewController()
    }
}
