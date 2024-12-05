//
//  AboutUs.swift
//  Have Salmon
//
//  Created by Skyler Hall on 6/26/24.
//

import SwiftUI

struct AboutUs: View {
    var body: some View {
        Color(hex: "#FCF0E8").ignoresSafeArea().overlay{
            VStack(alignment:.center) {
                Text("The Mission\n").bold().font(.system(size:35)).multilineTextAlignment(.center)
                Text("Here at \"Have Salmon\" we pride ourselves in reliable dining hall information.\n\n").italic().multilineTextAlignment(.center)
                Text("As hungry freshmen who didn't know whether Andrews had salmon, we made it our mission to ensure that all students can Have Salmon.").multilineTextAlignment(.center)
                Text("\nPatch Notes\n").bold().font(.system(size:35)).multilineTextAlignment(.center)
                Text("Version 1.0: Launch\n\nVersion 1.1: Wait Times added\n\nVersion 1.2: World Domination (coming soon)")
            }
        }
    }
}

#Preview {
    AboutUs()
}
