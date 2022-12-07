//
//  CardView.swift
//  CH5-watchOS
//
//  Created by Ana Kiara Medeiros Braga on 11/11/22.
//

import SwiftUI

struct CardView: View {
    @Binding var routine: RoutineInfo
    @State var text = ""
    @State var colorCompleted = ""
    
    var body: some View {
        VStack {
            ZStack {
                Image("\(routine.imageShift)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 112)
                ZStack {
                    Rectangle()
                        .frame(width: 350, height: 56)
                        .foregroundColor(.cardBackground)
                    
                    HStack {
                        VStack (alignment: .leading) {
                            Text("\(routine.shift)")
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                                .foregroundColor(.titleCardColor)
                            Text(text)
                                .font(.system(size: 13))
                                .foregroundColor(Color(colorCompleted))
                        }
                        Spacer()
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.purpleColor)
                    }
                    .frame(width: 300, height: 40)
                }
                .padding([.top], 64)
            }
        }
        .cornerRadius(12)
        .padding(.bottom)
    }
}

struct CardListView: View {
    @Binding var routine: RoutineInfo
    //    @AppStorage("fezRotina") var fezRotina = false
    //    @State var isActive : Bool = false
    @State var text = ""
    @State var colorCompleted = ""
    
    var body: some View {
        VStack {
            ZStack {
                Image("\(routine.imageShift)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 112)
                
                ZStack {
                    Rectangle()
                        .frame(width: 350, height: 56)
                        .foregroundColor(.cardBackground)
                    
                    HStack {
                        VStack (alignment: .leading) {
                            Text("\(routine.shift)")
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                                .foregroundColor(.titleCardColor)
                            
                            //                            if fezRotina {
                            //                                Text("Rotina concluída")
                            //                            }
                            //                            else {
                            //                                Text("Possui \(routine.numberSteps) passos")
                            //                                    .font(.system(size: 13))
                            //                                    .foregroundColor(.descriptionCardColor)
                            Text(text)
                                .font(.system(size: 13))
                                .foregroundColor(Color(colorCompleted))
                            //}
                            
                        }
                        
                        Spacer()
                        
                        
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.purpleColor)
                        
                        
                    }
                    .frame(width: 300, height: 40)
                }
                .padding([.top], 64)
                
            }
            
        }
        .cornerRadius(12)
        .padding(.bottom)
    }
}
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardListView(routine: .constant(RoutineInfo.datas[0]), text: "", colorCompleted: "")
    }
}
