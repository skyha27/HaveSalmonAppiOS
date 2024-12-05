//
//  ContentView.swift
//  Have Salmon
//
//  Created by Skyler Hall on 6/26/24.
//

import SwiftUI
import Firebase
import FirebaseDatabase
import FirebaseFirestore



extension Color {
    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
//        print(cleanHexCode)
        var rgb: UInt64 = 0
        
        Scanner(string: cleanHexCode).scanHexInt64(&rgb)
        
        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue)
    }
}

enum Screen {
    case screen1, screen2
}


struct ContentView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var count = 0
    @State private var screen = Screen.screen1
    
    init() {
    }
    
    var body: some View {
        ZStack(alignment:.center) {
            VStack {
                Home()
            }
            //            switch screen {
            //            case .screen1:
            //                VStack {
            //                    Loading()
            //                }
            //            case .screen2:
            //                VStack {
            //                    Home()
            //                }
            //            }
            //
            //            Text("").onReceive(timer) {time in
            //                if(count == 2) {
            //                    print("yer")
            //                    screen = .screen2
            //                }
            //                count += 1
            //            }
            //        }
            .onAppear {
                NotificationManager.instance.requestAuthorization()
                NotificationManager.instance.scheduleNotification()
            }
        }
        
        //    #Preview {
        //        ContentView()
        //    }
        
        
    }
}
