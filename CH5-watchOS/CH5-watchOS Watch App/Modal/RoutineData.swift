//
//  DailySkinCare.swift
//  CH5-watchOS Watch App
//
//  Created by Luciano Uchoa on 09/11/22.
//

import Foundation

struct RoutineData: Identifiable, Hashable , Codable{
    let id: UUID
    var shift: String
    var numberSteps: Int
    var titleStep: [String]
    var descriptionStep: [String]
    var imageShift: String
    var imagesSteps: [String]
    var timeSteps: [Int]
    
    
    init(id: UUID = UUID(), shift: String, numberSteps: Int,  titleStep: [String], descriptionStep: [String], imageShift: String, imagesSteps: [String], timeSteps: [Int]) {
        self.id = id
        self.shift = shift
        self.numberSteps = numberSteps
        self.titleStep = titleStep
        self.descriptionStep = descriptionStep
        self.imageShift = imageShift
        self.imagesSteps = imagesSteps
        self.timeSteps = timeSteps
        
    }
    
    struct Data{
        var shift = ""
        var numberSteps : Double = 3
        var titleStep =  [""]
        var descriptionStep = [""]
        var imageShift = ""
        var imagesSteps = [""]
        var timeSteps = [2]
    
    }
    
    var data: Data {
        Data(shift: shift, numberSteps: Double(numberSteps), titleStep: titleStep, descriptionStep: descriptionStep, imageShift: imageShift, imagesSteps: imagesSteps, timeSteps: timeSteps)
    }
    
    mutating func update(from data: Data){
        shift = data.shift
        numberSteps = Int(data.numberSteps)
        titleStep = data.titleStep
        descriptionStep = data.descriptionStep
        imagesSteps = data.imagesSteps
        imageShift = data.imageShift
        timeSteps = data.timeSteps
    }
    
    init(data: Data){
        id = UUID()
        shift = data.shift
        numberSteps = Int(data.numberSteps)
        titleStep = data.titleStep
        descriptionStep = data.descriptionStep
        imagesSteps = data.imagesSteps
        imageShift = data.imageShift
        timeSteps = data.timeSteps
    }
    
}

extension RoutineData {
    static let datas: [RoutineData] =
    [
        RoutineData(shift: "Manhã",
                    numberSteps: 3,
                    titleStep: ["Limpeza do rosto","Vitamina C", "Protetor solar"], descriptionStep: ["A limpeza do dia é essencial para o excesso de produtos.","Perfeita para dar mais brilho à pele. Espalhe por todo rosto.","Para o cuidado da sua pele contra os raios UV. Aplique, massageie e deixe agir."],
                    imageShift: "morning",
                    imagesSteps: ["wash","vitC","sunscreen"], timeSteps: [120, 30, 30]),
        RoutineData(shift: "Tarde",
                    numberSteps: 2,
                    titleStep: ["Limpeza do rosto", "Protetor solar"], descriptionStep: ["A limpeza do dia é essencial para o excesso de produtos.","Para o cuidado da sua pele contra os raios UV. Aplique, massageie e deixe agir."],
                    imageShift: "afternoon",
                    imagesSteps: ["wash","sunscreen"], timeSteps: [120, 30]),
        RoutineData(shift: "Noite",
                    numberSteps: 4,
                    titleStep: ["Limpeza do rosto", "Sérum", "Máscara Facial", "Vitamina C"], descriptionStep: ["A limpeza do dia é essencial para o excesso de produtos.","Ajuda na hidratação e briljo. Aplique o sérum e massageie por todo o rosto.","Calmante? Hidratante? Você escolhe. Aplique e deixe agir por 10min.","Perfeita para dar mais brilho à pele. Espalhe por todo rosto.!"],
                    imageShift: "night",
                    imagesSteps: ["wash", "vitC", "mask", "vitC"], timeSteps: [120, 30, 600, 30])
                    
    ]
}
