//
//  Settings.swift
//  Have Salmon
//
//  Created by Skyler Hall on 6/26/24.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager {
    static let instance = NotificationManager()
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("Error\(error)")
            }
            else {
                print("success in noti permissions")
            }
        }
    }
    
    func clearNotifications() {
        UNUserNotificationCenter.current().setBadgeCount(0)
    }
    
    func scheduleNotification() {
        let noti1 = UNMutableNotificationContent()
        noti1.title = "Happy Salmon Day!"
        noti1.subtitle = "You should celebrate by checking the Salmon Status!"
        noti1.sound = .default
        noti1.badge = 1
        
        let noti2 = UNMutableNotificationContent()
        noti2.title = "It's Dinner TIME!!!"
        noti2.subtitle = "Check now to see if Andrews current has salmon!"
        noti2.sound = .default
        noti2.badge = 1
        
        let noti3 = UNMutableNotificationContent()
        noti3.title = "Stop what ur doing RIGHT NOW!"
        noti3.subtitle = "...and have some salmon!"
        noti3.sound = .default
        noti3.badge = 1
        
        let noti4 = UNMutableNotificationContent()
        noti4.title = "It's getting a little late..."
        noti4.subtitle = "Make it a night to remember by checking the Salmon Status"
        noti4.sound = .default
        noti4.badge = 1
        
        let noti5 = UNMutableNotificationContent()
        noti5.title = "ANDREWS IS CLOSING SOON!"
        noti5.subtitle = "Check now to see if they still have Salmon!"
        noti5.sound = .default
        noti5.badge = 1
        
        let noti6 = UNMutableNotificationContent()
        noti6.title = "Do a good deed!"
        noti6.subtitle = "Vist Andrews to update the Salmon Status for ur fellow classmates"
        noti6.sound = .default
        noti6.badge = 1
        
        let noti7 = UNMutableNotificationContent()
        noti7.title = "Oooh, ur vising Andrews today?"
        noti7.subtitle = "Maybe update the Salmon Status while ur there... idk just a thought"
        noti7.sound = .default
        noti7.badge = 1
        
        let noti8 = UNMutableNotificationContent()
        noti8.title = "Passing by Andrews?"
        noti8.subtitle = "Check now to see if they still have Salmon!"
        noti8.sound = .default
        noti8.badge = 1
        
        let earlyNotiArray = [noti1, noti2, noti3]
        let lateNotiArray = [noti4, noti5, noti6]
        let inAndrewsArray = [noti7, noti8]
        
        var earlyComponets = DateComponents()
            earlyComponets.weekday = 3
            earlyComponets.hour = 16
            earlyComponets.minute = 0
        
        var lateComponents = DateComponents()
            lateComponents.weekday = 3
            lateComponents.hour = 19
            lateComponents.minute = 30
        
        
        let AndrewsCoordinates = CLLocationCoordinate2D(latitude: 41.83052, longitude: 71.40250)
        let AndrewsRegion = CLCircularRegion(center: AndrewsCoordinates, radius: 30, identifier: UUID().uuidString)
            AndrewsRegion.notifyOnEntry = true
            AndrewsRegion.notifyOnExit = false
        
        let earlyTrigger = UNCalendarNotificationTrigger(dateMatching: earlyComponets, repeats: true)
        let lateTrigger = UNCalendarNotificationTrigger(dateMatching: lateComponents, repeats: true)
//        let locationTrigger = UNLocationNotificationTrigger(region: AndrewsRegion, repeats: true)

//        UNTimeIntervalNotificationTrigger(timeInterval: 3.0, repeats: false)
        
        let earlyRequest = UNNotificationRequest(identifier: UUID().uuidString, content: earlyNotiArray.randomElement()!, trigger: earlyTrigger)
        let lateRequest = UNNotificationRequest(identifier: UUID().uuidString, content: lateNotiArray.randomElement()!, trigger: lateTrigger)
//        let locationRequest = UNNotificationRequest(identifier: UUID().uuidString, content: inAndrewsArray.randomElement()!, trigger: locationTrigger)
        
//        let date = Date()
//        let calendar = Calendar.current
//        let day = calendar.component(.weekday, from: date)
//        let hour = calendar.component(.hour, from: date)
//        let minute = calendar.component(.minute, from: date)
//        print("\(day) \(hour) \(minute)")
        
        UNUserNotificationCenter.current().add(earlyRequest)
        UNUserNotificationCenter.current().add(lateRequest)
//        UNUserNotificationCenter.current().add(locationRequest)
        
       
        
        
    }
}



struct Settings: View {
    var body: some View {
        Color(hex: "#FCF0E8").ignoresSafeArea().overlay{
            VStack(alignment:.center) {
                Text("settings").bold().font(.system(size:35)).multilineTextAlignment(.center)
                Button("request notifications") {
                    NotificationManager.instance.requestAuthorization()
                }
                Button("clear notifications") {
                    NotificationManager.instance.clearNotifications()
                }
            }
        }
    }
}

#Preview {
    Settings()
}
