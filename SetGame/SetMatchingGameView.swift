//
//  SetMatchingGameView.swift
//  SetGame
//
//  Created by Mark Galanti on 7/21/20.
//  Copyright © 2020 Mark Galanti. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: SetMatchingGame
    var body: some View {
        VStack {
            Grid(items: viewModel.cardsInPlay) { card in
                CardView(card: card).onTapGesture {
                    withAnimation(.easeInOut(duration: 0.75)) {
                        self.viewModel.choose(card: card)
                    }
                }.padding(5)
            }.padding()
        }
        
    }

}

struct CardView: View {
    var card: Set.setCard
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    @ViewBuilder
    private func body(for size: CGSize) ->  some View {
        if card.isSelected || !card.isMatched {
            VStack {
                ForEach(0..<card.number+1) { _ in
                    ZStack {
                        if self.card.symbol == 0 {
                            Diamond().fill(colors[self.card.color]).opacity(shading[self.card.shade])
                            Diamond().stroke(colors[self.card.color], lineWidth: 4)
                            
                        } else if self.card.symbol == 1 {
                            Squiggle().fill(colors[self.card.color]).opacity(shading[self.card.shade])
                            Squiggle().stroke(colors[self.card.color], lineWidth: 4)
                            
                        } else {
                            Capsule().fill(colors[self.card.color]).opacity(shading[self.card.shade])
                            Capsule().stroke(colors[self.card.color], lineWidth: 4)
                        }
                        
                    }
                }
            }
            .cardify(isSelected: card.isSelected)
        }
    }
}

// MARK: - Constants

//let shapes: [AnyView] = [Diamond(), Diamond(), Squiggle()]
let numbers: [Int] = [1, 2, 3]
let colors: [Color] = [Color.purple, Color.green, Color.red]
let shading: [Double] = [0, 0.3, 1]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: SetMatchingGame())
    }
}
