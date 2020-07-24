//
//  SetCardGame.swift
//  SetGame
//
//  Created by Mark Galanti on 7/21/20.
//  Copyright © 2020 Mark Galanti. All rights reserved.
//

import Foundation
import SwiftUI

class SetMatchingGame: ObservableObject{
    @Published private var game: Set
    
    init() {
        game = SetMatchingGame.createSetDeck()
    }
    
    private static func createSetDeck() -> Set {
        return Set()
    }
    
    
    // MARK: - Access to the Model
    
    var deck: Array<Set.setCard> {
        game.deck
    }
    
    var indexOfTopDeck: Int {
        game.indexOfTopDeck
    }
    
//    var score: Int {
//        game.score
//    }

    
    // MARK: - Intent(s)
    
    func choose(card: Set.setCard) {
        game.choose(card: card)
    }
    
    func dealThree(deck: Array<Set.setCard>) {
        game.dealThree(deck: deck)
    }
}
