//
//  RoutineInfo.swift
//  CH5-watchOS
//
//  Created by Ana Kiara Medeiros Braga on 09/11/22.
//

import Foundation

struct RoutineInfo: Identifiable {
    let id: UUID
    var shift: String
    var numberSteps: Int
    var titleStep: [String]
    var descriptionStep: [String]
    var imageShift: String
    var imagesSteps: [String]
    
    init(id: UUID = UUID(), shift: String, numberSteps: Int,  titleStep: [String], descriptionStep: [String], imageShift: String, imagesSteps: [String]) {
        self.id = id
        self.shift = shift
        self.numberSteps = numberSteps
        self.titleStep = titleStep
        self.descriptionStep = descriptionStep
        self.imageShift = imageShift
        self.imagesSteps = imagesSteps
    }
}

extension RoutineInfo {
    static let datas: [RoutineInfo] =
    [
        RoutineInfo(shift: "Manhã", numberSteps: 3, titleStep: ["Limpeza do rosto", "Vitamina C", "Protetor solar"], descriptionStep: ["A primeira limpeza do dia é essencial para produtos do dia anterior e é uma ótima maneira de começar o dia.", "A vitamina C é perfeita para dar mais brilho à pele e previne dos sinais de envelhecimento.", "Para manter seu rosto protegido dos raios ultravioleta e dos danos que vem com o excesso deles, o protetor solar ideal é com FPS de 30 ou maior. Não esqueça do pescoço!"], imageShift: "morning", imagesSteps: ["wash", "vitC", "sunscreen"]),
        RoutineInfo(shift: "Tarde", numberSteps: 2, titleStep: ["Limpeza do rosto", "Protetor solar"], descriptionStep: ["A primeira limpeza do dia é essencial para produtos do dia anterior e é uma ótima maneira de começar o dia.", "Para manter seu rosto protegido dos raios ultravioleta e dos danos que vem com o excesso deles, o protetor solar ideal é com FPS de 30 ou maior. Não esqueça do pescoço!"], imageShift: "afternoon", imagesSteps: ["wash", "sunscreen"]),
        RoutineInfo(shift: "Noite", numberSteps: 4, titleStep: ["Limpeza do rosto", "Vitamina C", "Hidratante", "Serum"], descriptionStep: ["A primeira limpeza do dia é essencial para produtos do dia anterior e é uma ótima maneira de começar o dia.", "A vitamina C é perfeita para dar mais brilho à pele e previne dos sinais de envelhecimento.", "Para manter seu rosto protegido dos raios ultravioleta e dos danos que vem com o excesso deles, o protetor solar ideal é com FPS de 30 ou maior. Não esqueça do pescoço!", "Para manter seu rosto protegido dos raios ultravioleta e dos danos que vem com o excesso deles, o protetor solar ideal é com FPS de 30 ou maior. Não esqueça do pescoço!"], imageShift: "night", imagesSteps: ["wash", "vitC", "vitC", "vitC"])
    ]
}
