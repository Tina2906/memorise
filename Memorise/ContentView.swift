//
//  ContentView.swift
//  Memorise
//
//  Created by Valentyna Kharkova on 08.09.2024.
//

import SwiftUI

struct ContentView: View {
    
    let emojis: [String] = ["👻","🎃","🕷️","😈"]
    
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self)  { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.purple)
            .padding()
            
        }
    }

struct CardView: View {
    let content: String
   @State var faceUp = true
    var body: some View {
        ZStack {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if faceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            } else {
                    base.foregroundColor(.purple)
                    base.fill()
            }
        }
        .onTapGesture {
            faceUp.toggle()
        }

    }
}















#Preview {
    ContentView()
}
