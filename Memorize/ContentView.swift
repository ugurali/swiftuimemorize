//
//  ContentView.swift
//  Memorize
//
//  Created by Ali Ugur Aker on 06.11.22.
//

import SwiftUI
import ScrollViewIfNeeded

struct ContentView: View {
    //ObservedObject: Redraw the screen re-draw the screen
    @ObservedObject var viewModel = EmojiMemoryGame()
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, content: {
                    Text("Memorise Game")
                        .font(.title)
                    Text(viewModel.selectedTheme.name)
                        .font(.body)
                })
                Spacer()
                Button(action: {
                    viewModel.newGame()
                }, label: {
                    Text(Image(systemName: "plus"))
                        .font(.title)
                })
            }.padding()
            ScrollViewIfNeeded {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))], spacing: 10) {
                    ForEach(viewModel.cards, content: { card in
                        CardView(card: card).aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    })
                }
            }
            .foregroundColor(themeColor)
            .font(.largeTitle)
            .padding()
            Text("Score: \(viewModel.score)")
                .font(.title)
        }
    }
    
    var themeColor: Color {
        switch viewModel.selectedTheme.color {
            case "red":
                return .red
            case "green":
                return .green
            case "orange":
                return .orange
            case "yellow":
                return .yellow
            case "blue":
                return .blue
            default:
                return .purple
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
