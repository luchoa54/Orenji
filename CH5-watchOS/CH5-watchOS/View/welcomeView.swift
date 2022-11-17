//
//  welcomeView.swift
//  CH5-watchOS
//
//  Created by Ana Kiara Medeiros Braga on 16/11/22.
//

import SwiftUI

struct Settings {
    static let firstOrangeName = "firstName"
}

struct welcomeView: View {
    
//    @State var orangeName: String = UserDefaults.standard.string(forKey: "TEXT_KEY") ?? ""
    @AppStorage(Settings.firstOrangeName) var orangeName = ""
    @AppStorage("HAS ONBOARD") var show = false
    
//    @EnvironmentObject var appState: AppState
    @Binding var routine: RoutineInfo
    
    var body: some View {
        VStack {
            
            Spacer()
            
            HStack {
                Text("Seja bem-vindo!")
                    .font(.system(size: 24))
                    .fontWeight(.black)
                    .foregroundColor(.titleColor)
                    .padding()
                
                Spacer()
            }
            
            Spacer()
            
            VStack (spacing: 20){
                Text("Antes de começarmos, que tal nomear sua laranjinha?")
                    .font(.system(size: 17))
                    .foregroundColor(.titleColor)
                            
                TextField("Qual meu nome?", text: $orangeName)
                    .padding()
                    .background(Color.orangeNameBackground)
                    .cornerRadius(12)
            }
            .padding()
            
            Spacer()
            
            Image("mainhappy")
            
            Spacer()
            
            Button {
                UserDefaults.standard.set(orangeName, forKey: "TEXT_KEY")
                show = true
                
            } label: {
                NavigationLink(destination: RegistrationView(routine: $routine)) {
                        Text("Vamos lá!")
                            .foregroundColor(.textButtonStep)
                            .font(.system(size: 17))
                            .frame(width: 350, height: 52)
                    
                    }
                    .background(Color.purpleColor)
                    .cornerRadius(12)
            }
            
        }
        .padding()
        .background(Color.welcomeBackground)
        .ignoresSafeArea()
    }
}

struct welcomeView_Previews: PreviewProvider {
    static var previews: some View {
        welcomeView(routine: .constant(RoutineInfo.datas[0]))
    }
}
