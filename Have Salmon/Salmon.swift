//
//  Salmon.swift
//  Have Salmon
//
//  Created by Skyler Hall on 10/12/24.
//

import SwiftUI

struct Salmon: View {
    
    @State private var updatedStatus = "pls wait"

    var body: some View {
        VStack(alignment:.center) {
            
            NavigationView {
                Color(hex: "#FCF0E8").ignoresSafeArea().overlay{
                    Text("")
                    Section {
                        Text("Current Salmon status: \n\n\n")
                        Text(updatedStatus).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .onAppear{
                                FirestoreDB.updateStatus{
                                    status in self.updatedStatus = status
                                }
                            }.font(.system(size:35)).frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).multilineTextAlignment(.center)
                        Button("Change Status") {
                            let url = URL(string:"https://havesalmon.com/")!
                            UIApplication.shared.open(url)
                        }.frame(width: 200, height: 75).foregroundColor(Color(hex: "#FFFFFF")).buttonStyle(.borderedProminent).position(x:200, y:430)
                            }
                }
            }
        }.onAppear {
            UNUserNotificationCenter.current().setBadgeCount(0)}
    }
}

#Preview {
    Salmon()
}
