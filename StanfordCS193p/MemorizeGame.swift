//
//  MemorizeGame.swift
//  StanfordSwiftUI
//
//  Created by Medhat Mebed on 10/30/23.
//

import Foundation

struct MemoryGame<CardContent> {
    
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
