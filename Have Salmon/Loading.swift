//
//  Loading.swift
//  Have Salmon
//
//  Created by Skyler Hall on 6/26/24.
//

import SwiftUI

let splashes = ["Bruno, U Know!","Let's get this party started!", "We know ur hungry ;)", "U are loved!", "This is ur sign to stop/start working!", "FIIIIIISH!", "Scream if u love salmon!", "GO BRUNO!", "UR GOLDEN!", "Is it V-Double day?", "I promise the Ratty isn't mid", "Jo's... thats it", "Time to LOCK IN!", "The Sci-Li is the best library"]


struct Loading: View {
    @State private var isRotating = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var degrees = 0.0
    var splash = splashes.randomElement()!
    
    var body: some View {
        Color(hex: "#FCF0E8").ignoresSafeArea().overlay{
            //            Image("new salmon logo").resizable().frame(width: 300, height: 300).position(x:200,y:300)
            Image("new salmon logo").resizable().frame(width: 200, height: 200).position(x:200,y:200).rotationEffect(.degrees(degrees),anchor: .center)
            Text(splash).bold().font(.system(size:20)).multilineTextAlignment(.center)
            Text("\n\n\n\nnow have some salmon").multilineTextAlignment(.center)
            Text("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n...loading").font(.system(size:12)).multilineTextAlignment(.center)
            Text("").onReceive(timer) {time in
                if(degrees == 360) {
                    degrees = 0
                }
                degrees += 2
            }

        }
    }
    }

#Preview {
    Loading()
}
