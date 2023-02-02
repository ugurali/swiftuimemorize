//
//  ContentView.swift
//  Memorize
//
//  Created by Ali Ugur Aker on 06.11.22.
//

import SwiftUI

enum GameTheme {
    case Vehicles
    case Christmas
    case Halloween
}

struct ContentView: View {
    @State var theme: GameTheme = .Vehicles
    
    //ObservedObject: Redraw the screen re-draw the screen
    @ObservedObject var viewModel = EmojiMemoryGame()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 10) {
                    ForEach(viewModel.cards, content: { card in
                        CardView(card: card).aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    })
                }
            }
            .foregroundColor(.red)
            .font(.largeTitle)
            .padding()
            
            Spacer()
            
            HStack{
                Button(action: {
                    theme = .Vehicles
                }, label: {
                    VStack {
                        Image("Car")
                        Text("Vehicles")
                            .foregroundColor(.red)
                    }
                })
                
                Spacer()
                
                Button(action: {
                    theme = .Christmas
                }, label: {
                    VStack {
                        Image("ChristmasTree")
                        Text("Christmas")
                            .foregroundColor(.green)
                    }
                })
                
                Spacer()
                
                Button(action: {
                    theme = .Halloween
                }, label: {
                    VStack {
                        Image("HalloweenPumpkin")
                        Text("Halloween")
                            .foregroundColor(.orange)
                    }
                })
            }
            .padding(.horizontal, 60)
        }
    }
    
    /*
    func dataSource() -> [String] {
        switch theme {
        case .Vehicles:
            return vehicles
        case .Christmas:
            return christmas
        case .Halloween:
            return halloween
        }
    }*/
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
