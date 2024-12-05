//
//  WaitTimes.swift
//  Have Salmon
//
//  Created by Skyler Hall on 10/12/24.
//

import SwiftUI
import Firebase
import FirebaseDatabase
import FirebaseFirestore

private let database = Firestore.firestore()

struct WaitTimes: View {
    
    @State private var updatedStatus = "pls wait"
    @State private var currentDay: String?
    @State private var currentHour: Int?
    @State private var currentTime: String?

    
    var body: some View {

        VStack(alignment:.center) {
            Section {
                NavigationView {
                    Color(hex: "#FCF0E8").ignoresSafeArea().overlay{
                        Text("")
                        Section {
                            Text("Andrews Hall: \n\n\n")
                            Text(updatedStatus).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .onAppear{
                                    if let currentDayStr = currentDay, let currentHourInt = currentHour{
                                        FirestoreDB().readTime(hour: currentHourInt, day:currentDayStr){
                                            status in self.updatedStatus = "~" + String(status) + " mins"
                                        }
                                    }
                                }.font(.system(size:30)).frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).multilineTextAlignment(.center)
                        }
                        if let time = currentTime {
                            Text("\n\n\n\nlast updated: " + String(time) + " EST").font(.system(size:12)).frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).multilineTextAlignment(.center)
                        }
                        Text("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n*Based off user reported wait times throughout October 2024").font(.system(size:12)).frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).multilineTextAlignment(.center)
                        
                    }
                }
            }
        }.onAppear {
            currentDay = String(Calendar.current.component(.weekday, from: Date())-1)
            currentHour = Calendar.current.component(.hour, from: Date())
            currentTime = String(Calendar.current.component(.hour, from: Date())) + ":" + String(Calendar.current.component(.minute, from: Date()))
            if let day = currentDay {
                print("Day: \(day)")
            }
            if let hour = currentHour {
                print("Hour: \(hour)")
            }
            if let time = currentTime {
                print("time \(time)")
            }
            UNUserNotificationCenter.current().setBadgeCount(0)}

    }
}

#Preview {
    WaitTimes()
}
