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
    
    init(id: UUID = UUID(), shift: String, numberSteps: Int,  titleStep: [String], descriptionStep: [String], imageShift: String) {
        self.id = id
        self.shift = shift
        self.numberSteps = numberSteps
        self.titleStep = titleStep
        self.descriptionStep = descriptionStep
        self.imageShift = imageShift
    }
}

extension RoutineInfo {
    static let datas: [RoutineInfo] =
    [
        RoutineInfo(shift: "Manhã", numberSteps: 3, titleStep: ["Limpeza do rosto", "Vitamina C", "Protetor solar"], descriptionStep: ["1 - Aqui você pode e mussum Ipsum, cacilds vidis litro abertis. Viva Forevis aptent taciti sociosqu ad litora torquent.", "2 - Aqui você pode e mussum Ipsum, cacilds vidis litro abertis. Viva Forevis aptent taciti sociosqu ad litora torquent.", "3 - Aqui você pode e mussum Ipsum, cacilds vidis litro abertis. Viva Forevis aptent taciti sociosqu ad litora torquent."], imageShift: "Morning"),
        RoutineInfo(shift: "Tarde", numberSteps: 2, titleStep: ["Limpeza do rosto", "Protetor solar"], descriptionStep: ["1 - Aqui você pode e mussum Ipsum, cacilds vidis litro abertis. Viva Forevis aptent taciti sociosqu ad litora torquent.", "2 - Aqui você pode e mussum Ipsum, cacilds vidis litro abertis. Viva Forevis aptent taciti sociosqu ad litora torquent."], imageShift: "Afternoon"),
        RoutineInfo(shift: "Noite", numberSteps: 4, titleStep: ["Limpeza do rosto", "Vitamina C", "Hidratante", "Serum"], descriptionStep: ["1 - Aqui você pode e mussum Ipsum, cacilds vidis litro abertis. Viva Forevis aptent taciti sociosqu ad litora torquent.", "2 - Aqui você pode e mussum Ipsum, cacilds vidis litro abertis. Viva Forevis aptent taciti sociosqu ad litora torquent.", "3 - Aqui você pode e mussum Ipsum, cacilds vidis litro abertis. Viva Forevis aptent taciti sociosqu ad litora torquent.", "4 - Aqui você pode e mussum Ipsum, cacilds vidis litro abertis. Viva Forevis aptent taciti sociosqu ad litora torquent."], imageShift: "Night")
    ]
}
