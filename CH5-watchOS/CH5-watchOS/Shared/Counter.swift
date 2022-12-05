//
//  Counter.swift
//  TestWatchConnectivity
//
//  Created by Luciano Uchoa on 21/11/22.
//

import Combine
import WatchConnectivity

final class Counter: ObservableObject {
    var session: WCSession
    let delegate: WCSessionDelegate
    let subject = PassthroughSubject<Data, Never>()
    
    @Published private(set) var count: Data = Data()
    
    init(session: WCSession = .default) {
        self.delegate = SessionDelegater(countSubject: subject)
        self.session = session
        self.session.delegate = self.delegate
        self.session.activate()
        
        subject
            .receive(on: DispatchQueue.main)
            .assign(to: &$count)
    }
    
    func increment(rotinas: RoutineInfo) {
        count = Encode(payload: rotinas)
        session.sendMessage(["count": count], replyHandler: nil) { error in
            print(error.localizedDescription)
        }
    }
    
    func Encode<T: Encodable>(payload: T) -> Data {
          let encoder = JSONEncoder()
          let jsonData = try! JSONEncoder().encode(payload)
          return jsonData
      }
    
}
