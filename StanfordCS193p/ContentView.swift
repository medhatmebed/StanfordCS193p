//
//  ContentView.swift
//  StanfordCS193p
//
//  Created by Medhat Mebed on 10/30/23.
//

import SwiftUI


struct ContentView: View {
    let emojis = ["👻","🎃","🕷️","😈","💀", "🕸️", "🧙","🙀","👹","😱","☠️","🍭"]
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            cards
            cardCountAdjuster
        }
        .padding()
    }
    var cards : some View {
        HStack() {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
    }
    var cardCountAdjuster : some View {
        HStack {
            cardAdder
            Spacer()
            cardRemover
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    var cardRemover : some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
    var cardAdder : some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.fill.badge.plus")
    }
    
}

struct CardView: View {
    @State var isFaceUp = true
    let content : String
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                //  base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}









#Preview {
    ContentView()
}
