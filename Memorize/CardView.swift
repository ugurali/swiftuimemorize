//
//  CardView.swift
//  Memorize
//
//  Created by Ali Ugur Aker on 06.11.22.
//

import SwiftUI

struct CardView: View {
    var content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let cardShape = RoundedRectangle(cornerRadius: 20)
            
            if isFaceUp {
                cardShape
                    .fill()
                    .foregroundColor(.white)
                cardShape
                    .strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            }
            else {
                cardShape
                    .fill()
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(content: "✈️")
    }
}
