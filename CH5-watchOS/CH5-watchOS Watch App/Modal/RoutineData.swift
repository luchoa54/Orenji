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
    var routineIsActive: Bool
    var weekStatus: [Bool]
    var stepStatus: [Bool]
    var notificationStatus: Bool
    var timeSteps: [Int]
    
    init(id: UUID = UUID(), shift: String, numberSteps: Int,  titleStep: [String], descriptionStep: [String], imageShift: String, imagesSteps: [String], routineIsActive: Bool, weekStatus: [Bool], stepStatus: [Bool], notificationStatus: Bool, timeSteps: [Int]) {
        self.id = id
        self.shift = shift
        self.numberSteps = numberSteps
        self.titleStep = titleStep
        self.descriptionStep = descriptionStep
        self.imageShift = imageShift
        self.imagesSteps = imagesSteps
        self.routineIsActive = routineIsActive
        self.weekStatus = weekStatus
        self.stepStatus = stepStatus
        self.notificationStatus = notificationStatus
        self.timeSteps = timeSteps
        
    }
    
    struct Data{
        var shift = ""
        var numberSteps : Double = 3
        var titleStep =  [""]
        var descriptionStep = [""]
        var imageShift = ""
        var imagesSteps = [""]
        var routineIsActive = false
        var weekStatus = [false, false, false, false, false, false, false]
        var stepStatus = [false, false, false, false, false, false, false]
        var notificationStatus = false
        var timeSteps = [2]
    
    }
    
    var data: Data {
        Data(shift: shift, numberSteps: Double(numberSteps), titleStep: titleStep, descriptionStep: descriptionStep, imageShift: imageShift, imagesSteps: imagesSteps,routineIsActive: routineIsActive, weekStatus: weekStatus, stepStatus: stepStatus, notificationStatus: notificationStatus,  timeSteps: timeSteps)
    }
    
    mutating func update(from data: RoutineInfo.NewData){
        shift = data.shift
        numberSteps = Int(data.numberSteps)
        titleStep = data.titleStep
        descriptionStep = data.descriptionStep
        imagesSteps = data.imagesSteps
        imageShift = data.imageShift
        routineIsActive = data.routineIsActive
        weekStatus = data.weekStatus
        stepStatus = data.stepStatus
        notificationStatus = data.notificationStatus
        timeSteps = data.timeStep
    }
    
    init(data: Data){
        id = UUID()
        shift = data.shift
        numberSteps = Int(data.numberSteps)
        titleStep = data.titleStep
        descriptionStep = data.descriptionStep
        imagesSteps = data.imagesSteps
        imageShift = data.imageShift
        routineIsActive = data.routineIsActive
        weekStatus = data.weekStatus
        stepStatus = data.stepStatus
        notificationStatus = data.notificationStatus
        timeSteps = data.timeSteps
    }
    
}

extension RoutineData {
    static let datas: [RoutineData] =
    [
        RoutineData(shift: "Manhã",
                    numberSteps: 3,
                    titleStep: ["Limpeza do rosto", "Hidratação da pele","Vitamina C", "Protetor solar", "Sérum", "Máscara Facial"], descriptionStep: ["A limpeza do dia é essencial para o excesso de produtos. É importante para preparar sua pele para os tratamentos que vem a seguir.","A hidratação de pele é importante principalmente para peles mais ressecadas","A vitamina C é perfeita para dar mais brilho à pele e previne dos sinais de envelhecimento.","Para manter seu rosto protegido dos raios ultravioleta e dos danos que vem com o excesso deles, o protetor solar ideal é com FPS de 30 ou maior. Não esqueça do pescoço!","O sérum é perfeito para dar mais brilho e hidratação para a pele.","Calmante? Hidratante? Você escolhe. Utiliza uma máscara facial para dar um tratamento especial pra sua pele."],
                    imageShift: "morning",
                    imagesSteps: ["wash", "wash", "vitC","sunscreen","vitC", "mask"],
                    routineIsActive: true,
                    weekStatus: [true, true, true, true, true, true, true],
                    stepStatus: [true, false, true, false, true, false, false],
                    notificationStatus: false,
                    timeSteps: [120, 120, 30, 30, 30, 600]),
        RoutineData(shift: "Tarde",
                    numberSteps: 2,
                    titleStep: ["Limpeza do rosto", "Hidratação da pele","Vitamina C", "Protetor solar", "Sérum", "Máscara Facial"], descriptionStep: ["A limpeza do dia é essencial para o excesso de produtos. É importante para preparar sua pele para os tratamentos que vem a seguir.","A hidratação de pele é importante principalmente para peles mais ressecadas","A vitamina C é perfeita para dar mais brilho à pele e previne dos sinais de envelhecimento.","Para manter seu rosto protegido dos raios ultravioleta e dos danos que vem com o excesso deles, o protetor solar ideal é com FPS de 30 ou maior. Não esqueça do pescoço!","O sérum é perfeito para dar mais brilho e hidratação para a pele.","Calmante? Hidratante? Você escolhe. Utiliza uma máscara facial para dar um tratamento especial pra sua pele."],
                    imageShift: "afternoon",
                    imagesSteps: ["wash", "wash", "vitC","sunscreen","vitC", "mask"],
                    routineIsActive: true,
                    weekStatus: [true, true, true, true, true, true, true],
                    stepStatus: [true, false, true, false, false, false, false],
                    notificationStatus: false,
                    timeSteps: [120, 120, 30, 30, 30, 600]),
        RoutineData(shift: "Noite",
                    numberSteps: 4,
                    titleStep: ["Limpeza do rosto", "Hidratação da pele", "Vitamina C", "Protetor solar", "Sérum", "Máscara Facial"], descriptionStep: ["A limpeza do dia é essencial para o excesso de produtos. É importante para preparar sua pele para os tratamentos que vem a seguir.","A hidratação de pele é importante principalmente para peles mais ressecadas","A vitamina C é perfeita para dar mais brilho à pele e previne dos sinais de envelhecimento.","Para manter seu rosto protegido dos raios ultravioleta e dos danos que vem com o excesso deles, o protetor solar ideal é com FPS de 30 ou maior. Não esqueça do pescoço!","O sérum é perfeito para dar mais brilho e hidratação para a pele.","Calmante? Hidratante? Você escolhe. Utiliza uma máscara facial para dar um tratamento especial pra sua pele."],
                    imageShift: "night",
                    imagesSteps: ["wash", "wash", "vitC","sunscreen","vitC", "mask"],
                    routineIsActive: true,
                    weekStatus: [true, true, true, true, true, true, true],
                    stepStatus: [true, false, true, true, true, false, false],
                    notificationStatus: false,
                    timeSteps: [120, 120, 30, 30, 30, 600])
                    
    ]
}
