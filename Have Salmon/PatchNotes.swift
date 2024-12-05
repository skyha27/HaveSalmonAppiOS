//
//  PatchNotes.swift
//  Have Salmon
//
//  Created by Skyler Hall on 6/26/24.
//

import SwiftUI

struct PatchNotes: View {
    var body: some View {
        Color(hex: "#FCF0E8").ignoresSafeArea().overlay{
            VStack(alignment:.center) {
                Text("Version 1.0: Launch\n\nVersion 1.1: Wait Times added\n\nVersion 1.2: World Domination (coming soon)")
            }
        }
    }
}

#Preview {
    PatchNotes()
}
