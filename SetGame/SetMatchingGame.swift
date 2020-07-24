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
    
    var cardsInPlay: Array<Set.setCard> {
        game.cardsInPlay
    }
    
    var score: Int {
        game.score
    }
    
    var indexOfTopDeck: Int {
        game.indexOfTopDeck
    }
    
//    var colorFeatures: Array<Color> {
//        game.colorFeatures
//    }
    
    // MARK: - Intent(s)
    
    func choose(card: Set.setCard) {
        game.choose(card: card)
    }
}
