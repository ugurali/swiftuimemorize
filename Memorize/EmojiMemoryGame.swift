//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ugur Aker on 25.01.2023.
//

// ViewModel can import SwiftUI
import SwiftUI

/*
 ViewModels are classes
 ObservableObject: So it announces that things are changing. Important for reactive programming
 */
class EmojiMemoryGame: ObservableObject {
    static let vehicles = ["✈️", "🛳️", "🚗", "🚌", "🚙", "🚐", "🚚", "🚜", "🚝", "🚁", "🛶", "🛵", "🚡"]
    static let christmas = ["🎄", "🎅", "🎁", "☕️", "❄️", "☃️", "🧦", "🧣", "🥶"]
    static let halloween = ["🕸️", "👻", "🎃", "💀", "🍁", "🍂", "🥮", "😱", "🙀", "👺"]
        
    // so other classes can read it but not change it
    // private(set) var model: MemoryGame<String>
    
    // Published: Announces the changes in the property to the observers
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(
            numberOfPairsOfCards: 6,
            createCardContent: createCardContent
        )
    }
    
    static func createCardContent(index: Int) -> String {
        return vehicles[index]
    }
    
    // if there are multiple fields and you dont want all of them to be readable
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
