//
//  ContentView.swift
//  Memorise
//
//  Created by Valentyna Kharkova on 08.09.2024.
//

import SwiftUI

struct ContentView: View {
    
    let emojis: [String] = ["👻","🎃","🕷️","😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        ScrollView {
            cards
            Spacer()
            cardCountAdjusters
        }
            .padding()
        }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self)  { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
            .foregroundColor(.purple)
        }
        
    }
    
    var cardAdder: some View {
        return cardCountAdjuster(by: +1, symbol: "rectangle.stack.fill.badge.plus")
            .imageScale(.large)
            .font(.largeTitle)
            .foregroundColor(.yellow)
    }
    
    var cardRemoval: some View {
        return cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
        .imageScale(.large)
        .font(.largeTitle)
        .foregroundColor(.yellow)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardAdder
            Spacer()
            cardRemoval
        }
    }
}



struct CardView: View {
    let content: String
   @State var faceUp = true
    var body: some View {
        ZStack {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(faceUp ? 1 : 0)
            base.fill().opacity(faceUp ? 0 : 1)
        }
        .onTapGesture {
            faceUp.toggle()
        }

    }
}















#Preview {
    ContentView()
}
