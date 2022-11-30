//
//  NotificationManager.swift
//  Orenji
//
//  Created by Ana Kiara Medeiros Braga on 25/11/22.
//

import Foundation
import UserNotifications

class NotificationManager {
    static let instance = NotificationManager()

    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("ERROR: \(error)")
            }
            else {
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotificationMorning() {
        
        let content = UNMutableNotificationContent()
        content.title = "hello"
        content.sound = .default
        content.badge = 1
        
        var dateComponents = DateComponents()
        dateComponents.hour = 11
        dateComponents.minute = 28
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func scheduleNotificationAfternoon() {
        
        let content = UNMutableNotificationContent()
        content.title = "hello"
        content.sound = .default
        content.badge = 1
        
        var dateComponents = DateComponents()
        dateComponents.hour = 11
        dateComponents.minute = 28
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func scheduleNotificationNight() {
        
        let content = UNMutableNotificationContent()
        content.title = "hello"
        content.sound = .default
        content.badge = 1
        
        var dateComponents = DateComponents()
        dateComponents.hour = 11
        dateComponents.minute = 28
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}
