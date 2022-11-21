//
//  RoutineStore.swift
//  CH5-watchOS
//
//  Created by Luciano Uchoa on 21/11/22.
//

import Foundation
import SwiftUI

class RoutineStore: ObservableObject {
    @Published var routine: [RoutineInfo] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("routine.data")
    }
    
    static func load(completion: @escaping (Result<[RoutineInfo], Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let routineInfo = try JSONDecoder().decode([RoutineInfo].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(routineInfo))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    static func save(routine: [RoutineInfo], completion: @escaping (Result<Int, Error>)->Void) {
            DispatchQueue.global(qos: .background).async {
                do {
                    let data = try JSONEncoder().encode(routine)
                    let outfile = try fileURL()
                    try data.write(to: outfile)
                    DispatchQueue.main.async {
                        completion(.success(routine.count))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            }
        }
}
