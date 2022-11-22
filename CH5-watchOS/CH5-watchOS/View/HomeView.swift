//
//  HomeView.swift
//  CH5-watchOS
//
//  Created by Ana Kiara Medeiros Braga on 11/11/22.
//

import SwiftUI

struct HomeView: View {
    @Binding var routine: [RoutineInfo]
    //     @AppStorage("rotina concluida") var routineDone = false
    @AppStorage("orange") var assetOrange = "mainsad"
    @AppStorage("fezRotina") var fezRotina = false
//    @State var orangeName = UserDefaults.standard.string(forKey: "laranjito")
    @AppStorage("laranjito") var orangeName = ""
    @State var isActive : Bool = false
    @State var shift: Int
    @State var tempo: String = ""
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            HStack {
                Text("Vamos cuidar da sua pele?")
                    .font(.system(size: 24))
                    .fontWeight(.black)
                    .foregroundColor(.titleColor)
                //.padding([.horizontal], 20)
                Spacer()
                //                 Button {
                //
                //                 } label: {
                //                     Image(systemName: "plus.app.fill")
                //                         .resizable()
                //                         .foregroundColor(.purpleColor)
                //                         .frame(width: 48, height: 44)
                //                         //.padding([.horizontal], 31)
                //
                //                 }
            }
            Spacer()
            Text("\(orangeName) está com a pele bem maltrada. Que tal iniciar sua rotina de skincare?")
                .padding()
                .padding(.horizontal)
                .multilineTextAlignment(.center)
                .font(.system(size: 12))
                .foregroundColor(.orangeText)
                .background(Color.orangeLabelBackground)
                .cornerRadius(12)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.orangeBorder,lineWidth: 1))
            Spacer()
            Image("\(assetOrange)")
            Spacer()
            Text("Suas atividades")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(.titleColor)
                .padding([.trailing], 204)
            if  tempo >= "00:00" && tempo <= "00:11"{
                
                    if(routine[0].numberSteps > 0){
                        NavigationLink(destination: StepByStepView(routine: $routine[0], rootIsActive: self.$isActive), isActive: self.$isActive){
                            //                         CardView(routine: $routine[0], text: fezRotina ? "Rotina concluída" : "Possui \(routine[0].numberSteps) passos")
                            if fezRotina {
                                CardView(routine: $routine[0], text: "Rotina concluída", colorCompleted: "greenCompleted")
                            }
                            else {
                                CardView(routine: $routine[0], text: "Possui \(routine[0].numberSteps) passos", colorCompleted: "descriptionCard")
                                    
                            }
                        }
                    }else {
                        Rectangle()
                            .frame(width: 264, height: 120, alignment: .center)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .overlay(
                                Text("Você não adicionou nenhum passo nessa rotina!")
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            )
                    }
                    Spacer()
                
            }else if tempo >= "00:14" && tempo <= "16:59"{
                    if(routine[1].numberSteps > 0){
                        NavigationLink(destination: StepByStepView(routine: $routine[1], rootIsActive: self.$isActive), isActive: self.$isActive){
                            if fezRotina {
                                CardView(routine: $routine[1], text: "Rotina concluída", colorCompleted: "greenCompleted")
                                
                            }
                            else {
                                CardView(routine: $routine[1], text: "Possui \(routine[0].numberSteps) passos", colorCompleted: "descriptionCard")
                            }
                        }
                    }else {
                        Rectangle()
                            .frame(width: 264, height: 120, alignment: .center)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .overlay(
                                Text("Você não adicionou nenhum passo nessa rotina!")
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            )
                    }
                    Spacer()
                
            }else if tempo >= "19:00" && tempo <= "23:47"{
                
                    if(routine[2].numberSteps > 0){
                        NavigationLink(destination: StepByStepView(routine: $routine[2], rootIsActive: self.$isActive), isActive: self.$isActive){
                            if fezRotina {
                                CardView(routine: $routine[2], text: "Rotina concluída", colorCompleted: "greenCompleted")
                            }
                            else {
                                CardView(routine: $routine[2], text: "Possui \(routine[0].numberSteps) passos", colorCompleted: "descriptionCard")
                            }
                        }
                    }else {
                        Rectangle()
                            .frame(width: 264, height: 120, alignment: .center)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .overlay(
                                Text("Você não adicionou nenhum passo nessa rotina!")
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            )
                    }
                    Spacer()
                
            }
            else {
                if  tempo >= "00:12" && tempo <= "00:13" {
                    Text("Próxima skincare marcada para manhã.")
                        .padding()
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 12))
                        .foregroundColor(.orangeText)
                        .background(Color.orangeLabelBackground)
                        .cornerRadius(12)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.orangeBorder,lineWidth: 1))
                        .onAppear(){
                            fezRotina = false
                        }
                        
                }
                else if tempo >= "11:00" && tempo <= "12:59" {
                    Text("Próxima skincare marcada para tarde.")
                        .padding()
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 12))
                        .foregroundColor(.orangeText)
                        .background(Color.orangeLabelBackground)
                        .cornerRadius(12)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.orangeBorder,lineWidth: 1))
                        .onAppear(){
                            fezRotina = false
                        }
                }
                else if tempo >= "17:00" && tempo <= "18:59" {
                    Text("Próxima skincare marcada para noite.")
                        .padding()
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 12))
                        .foregroundColor(.orangeText)
                        .background(Color.orangeLabelBackground)
                        .cornerRadius(12)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.orangeBorder,lineWidth: 1))
                        .onAppear(){
                            fezRotina = false
                        }
                }
            }
        }
        .onAppear(){
            if fezRotina {
                assetOrange = "mainhappy"
            }
            else {
                assetOrange = "mainsad"
            }
        }
        .padding()
        .background(Image("mainbackground").resizable().scaledToFill())
        //.ignoresSafeArea()
        .navigationBarBackButtonHidden()
        //.navigationTitle("App")
        //.navigationBarTitleDisplayMode(.inline)
        .onReceive(timer){ timer in
            tempo = getTime()
        }
        .onAppear(){
            tempo = getTime()
        }
    }
}

func getTime() -> String {
    let formatter = DateFormatter()
    formatter.timeStyle = .short
    let dateString = formatter.string(from: Date())
    return dateString
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(routine: .constant(RoutineInfo.datas), shift: 1)
    }
}
