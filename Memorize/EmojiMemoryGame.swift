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
    static let themes: [Theme<String>] = [
        Theme<String>(
            name: "Halloween",
            color: "orange",
            values: ["🕸️", "👻", "🎃", "💀", "🍁", "🍂", "🥮", "😱", "🙀", "👺"]
        ),
        Theme<String>(
            name: "Christmas",
            color: "green",
            values: ["🎄", "🎅", "🎁", "☕️", "❄️", "☃️", "🧦", "🧣", "🥶"]
        ),
        Theme<String>(
            name: "Vehicles",
            color: "red",
            values: ["✈️", "🛳️", "🚗", "🚌", "🚙", "🚐", "🚚", "🚜", "🚝", "🚁", "🛶", "🛵"]
        ),
        Theme<String>(
            name: "Animals",
            color: "yellow",
            values: ["🐶", "🐱", "🐷", "🐮", "🐸", "🐤", "🐝", "🐴", "🐳", "🐑", "🐓", "🐊"]
        ),
        Theme<String>(
            name: "Emoticons",
            color: "blue",
            values: ["😆", "🥰", "😕", "😡", "🤯", "🫠", "🤢", "🤠", "😵", "🫡", "😎", "🥸"]
        )
    ]
    
    // so other classes can read it but not change it
    // private(set) var model: MemoryGame<String>
    
    // Published: Announces the changes in the property to the observers
    @Published private var model: MemoryGame<String>
    private(set) var selectedTheme: Theme<String>

    init() {
        selectedTheme = EmojiMemoryGame.themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(theme: selectedTheme)
    }
    
    static func createMemoryGame(theme: Theme<String>) -> MemoryGame<String> {
        return MemoryGame<String>(
            numberOfPairsOfCards: theme.values.count,
            createCardContent: { index in
                return theme.values[index]
            }
        )
    }
    
    
    // if there are multiple fields and you dont want all of them to be readable
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    var score: Int {
        return model.score
    }
    
    // MARK: - Intent(s)
    
    func newGame() {
        selectedTheme = EmojiMemoryGame.themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(theme: selectedTheme)
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
