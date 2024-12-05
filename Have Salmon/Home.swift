//
//  Home.swift
//  Have Salmon
//
//  Created by Skyler Hall on 6/26/24.
//

import SwiftUI
import Firebase
import FirebaseDatabase
import FirebaseFirestore

private let database = Firestore.firestore()

class FirestoreDB {
    @State private var currentDay: String?
    @State private var currentHour: Int?
    
    static func updateStatus(completion: @escaping (String)-> Void) {
        var currentStatus = "an error occured"
        print("updating status")
        let docRef = database.collection("status").document("status")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let status = document.data()?["status"] as? String ?? "Unknown"
                print(status)
                currentStatus = status
            }
            completion(currentStatus)
        }
    }
    func readTime(hour:Int, day: String, completion: @escaping (String)-> Void) {
        currentDay = String(Calendar.current.component(.weekday, from: Date()))
        currentHour = Calendar.current.component(.hour, from: Date())
                 if let day = currentDay {
                     print("Day: \(day)")
                 }
                 if let hour = currentHour {
                     print("Hour: \(hour)")
                 }
        
        var currentStatus = "an error occured"
        print("updating status")
        let docRef = database.collection("status").document("status")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let status = document.data()?["waitTime"] as? [String:Any] ?? [:]
                if let dayTimes = status[day] as? [Any] {
                    print(dayTimes)
                    if let currentWait = dayTimes[hour] as? String {
                        print(currentWait)
                        currentStatus = currentWait
                    }
                }
            }
            completion(currentStatus)
        }
    }
    }

    
    
struct Home: View {
    @State private var isRotating = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var degrees = 0.0
    var splash = splashes.randomElement()!
    
    var body: some View {
        NavigationView {
            Color(hex: "#FCF0E8").ignoresSafeArea().overlay{
                //            Image("new salmon logo").resizable().frame(width: 300, height: 300).position(x:200,y:300)
                Image("new salmon logo").resizable().frame(width: 200, height: 200).position(x:200,y:200).rotationEffect(.degrees(degrees),anchor: .center)
                Text(splash).bold().font(.system(size:20)).multilineTextAlignment(.center)
                Text("\n\n\n\nnow have some salmon").multilineTextAlignment(.center)
                Text("").onReceive(timer) {time in
                    if(degrees == 360) {
                        degrees = 0
                    }
                    degrees += 2
                }
                
            }
            .navigationTitle("")
                                        .toolbar(content: {
                                            ToolbarItemGroup(placement: .status)
                                            {
                                                NavigationLink(destination: WaitTimes()){
                                                    Text("Wait Times").foregroundColor(Color(hex: "#D6A297"))
                                                }
                                                NavigationLink(destination: Salmon()){
                                                    Text("Salmon").foregroundColor(Color(hex: "#D6A297"))
                                                }
                                                NavigationLink(destination: AboutUs()){
                                                    Text("About Us").foregroundColor(Color(hex: "#D6A297"))
                                                }
                                                NavigationLink(destination: Settings()){
                                                    Text("Settings").foregroundColor(Color(hex: "#D6A297"))
                                                }
                                            }
                                        }
                                        )}
        }
}
    

#Preview {
    Home()
}
