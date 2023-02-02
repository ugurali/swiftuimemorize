//
//  MemoryGame.swift
//  Memorize
//
//  Created by Ugur Aker on 25.01.2023.
//

import Foundation

// Models are struct
// where: you can how a generic type should look like
struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private var indexOfFacedUpCard: Int?
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for i in 0..<numberOfPairsOfCards {
            cards.append(Card(id: i*2, content: createCardContent(i)))
            cards.append(Card(id: i*2 + 1, content: createCardContent(i)))
        }
        cards.shuffle()
    }
    
    // arguments of functions are "let"s
    // We need to let the world know that this function updates our object
    mutating func choose(_ card: Card) {
        if let choosenIndex = cards.firstIndex(where: { $0.id == card.id }),
            !cards[choosenIndex].isFaceUp,
            !cards[choosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfFacedUpCard {
                if cards[potentialMatchIndex].content == cards[choosenIndex].content {
                    cards[potentialMatchIndex].isMatched = true
                    cards[choosenIndex].isMatched = true
                }
                indexOfFacedUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfFacedUpCard = choosenIndex
            }
            
            cards[choosenIndex].isFaceUp.toggle()
        }
    }
    
    /*
    private func index(of card: Card) -> Int? {
        print("cards = \(cards)")
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }*/
    
    /*
     We have added card in the struct since card
     lives in memory game context. What if we also have another
     game such as poker
    */
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false // faced up and not matched
        var isMatched: Bool = false
        var content: CardContent
    }
}
