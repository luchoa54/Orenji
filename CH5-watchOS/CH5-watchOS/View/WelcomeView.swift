//
//  welcomeView.swift
//  CH5-watchOS
//
//  Created by Ana Kiara Medeiros Braga on 16/11/22.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var routine: [RoutineInfo]
    //@State var orangeName: String = UserDefaults.standard.string(forKey: "TEXT_KEY") ?? ""
    @AppStorage("laranjito") var orangeName = ""
    //@Binding var routine: RoutineInfo
    
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
                    .foregroundColor(.titleColor)
                    .background(Color.orangeNameBackground)
                    .cornerRadius(12)
            }
            .padding()
            
            Spacer()
            
            Image("mainhappy")
            
            Spacer()
            
            Button {
//                UserDefaults.standard.set(orangeName, forKey: "laranjito")
                
            } label: {
                NavigationLink(destination: RegistrationView(routine: $routine)) {
                        Text("Vamos lá!")
                            .foregroundColor(.textButtonStep)
                            .font(.system(size: 17))
                            .frame(width: 350, height: 52)
                    
                }.isDetailLink(false)
                    .background(Color.purpleColor)
                    .cornerRadius(12)
            }
            
        }
        .onAppear(){
            NotificationManager.instance.requestAuthorization()
        }
        .padding()
        .background(Color.welcomeBackground)
        .ignoresSafeArea()
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(routine: .constant(RoutineInfo.datas))
    }
}
