//
//  SetMatchingGameView.swift
//  SetGame
//
//  Created by Mark Galanti on 7/21/20.
//  Copyright © 2020 Mark Galanti. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var viewModel: SetMatchingGame
    var body: some View {
        VStack {
            Grid(items: viewModel.cardsInPlay) { card in
                CardView(card: card).onTapGesture {
                    withAnimation(.easeInOut(duration: 0.75)) {
                        self.viewModel.choose(card: card)
                    }
                }
            }.padding()
        }
        .padding()
    }

}

struct CardView: View {
    var card: Set.setCard
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                VStack{
                    Capsule()
                    Capsule()
                    Capsule()
                }.padding(5)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }.padding(5)
    }
}

// MARK: - Constants




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: SetMatchingGame())
    }
}
