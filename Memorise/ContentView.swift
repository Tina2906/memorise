//
//  ContentView.swift
//  Memorise
//
//  Created by Valentyna Kharkova on 08.09.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(faceUp: true)
            CardView(faceUp: false)
            CardView(faceUp: false)
            CardView(faceUp: false)
        }
        
        .foregroundColor(.purple)
            .padding()
            
        }
    }

struct CardView: View {
    var faceUp: Bool
    var body: some View {
        ZStack(content: {
            if faceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("🥰")
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.purple)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
            }
            
        })
    }
}















#Preview {
    ContentView()
}
