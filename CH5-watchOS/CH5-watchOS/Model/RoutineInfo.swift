//
//  RoutineInfo.swift
//  CH5-watchOS
//
//  Created by Ana Kiara Medeiros Braga on 09/11/22.
//

import Foundation

struct RoutineInfo: Identifiable, Hashable {
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
        RoutineInfo(shift: "Tarde", numberSteps: 2, titleStep: ["Limpeza do rosto", "Protetor solar"], descriptionStep: ["O excesso de produtos pode prejudicar sua pele, opte por sempre fazer uma limpeza antes de reforçar o cuidado com outro produto.", "É sempre bom reforçar o cuidado da sua pele com o protetor solar."], imageShift: "afternoon", imagesSteps: ["wash", "sunscreen"]),
        RoutineInfo(shift: "Noite", numberSteps: 4, titleStep: ["Limpeza do rosto", "Demaquilante", "Máscara", "Vitamina C"], descriptionStep: ["Hora de tirar todos os produtos da sua pele. Uma boa limpeza antes de dormir faz muito bem.", "O demaquilante reforça a retirada do excesso de produtos. Deixa sua pele limpinha e respirando.", "Calmante? Hidratante? Você escolhe. Utiliza uma máscara facial para dar um tratamento especial pra sua pele.", "A vitamina C também pode ser utilizada a noite e é perfeita para dar mais brilho à pele enquanto dormimos."], imageShift: "night", imagesSteps: ["wash", "vitC", "mask", "vitC"])
    ]
}
