//
//  Set.swift
//  SetGame
//
//  Created by Mark Galanti on 7/21/20.
//  Copyright © 2020 Mark Galanti. All rights reserved.
//

import Foundation

struct Set {
    private(set) var deck: Array<setCard>
    private(set) var cardsInPlay: Array<setCard>
    private(set) var selectedCardsIndices: Array<Int>
    private(set) var indexOfTopDeck: Int
    private(set) var score: Int

    
    init() {
        deck = Array<setCard>()
        indexOfTopDeck = 0
        score = 0
        cardsInPlay = Array<setCard>()
        selectedCardsIndices = Array<Int>()

        for symbolIndex in 0..<3 {
                for colorIndex in 0..<3 {
                    for shadeIndex in 0..<3 {
                        for numberIndex in 0..<3 {
                            deck.append(setCard(symbol: symbolIndex,
                                                color: colorIndex,
                                                shade: shadeIndex,
                                                number: numberIndex,
                                                id: (symbolIndex*1000 + colorIndex*100 + shadeIndex*10 + numberIndex)))
                        }
                    }
                }
            }
        deck.shuffle()
        deal(deck: deck)
    }
    
    mutating func deal(deck: Array<setCard>) {
        for _ in 0..<12 {
        cardsInPlay.append(deck[indexOfTopDeck])
        indexOfTopDeck += 1
        }
    }
    
    
    mutating func dealThree(deck: Array<setCard>) {
        for _ in 0..<3 {
            if indexOfTopDeck >= 81 {
            return // TODO: Shouldn't get here need some restriction
        }
        cardsInPlay.append(deck[indexOfTopDeck])
        indexOfTopDeck += 1
        }
    }

    
    mutating func choose(card: setCard) {
        // choose, if not third chosen, mark seen then do nothing -- need func to check
        // if third chosen check if matching, then change isMatched to true
        print(card)
        print(selectedCardsIndices)
        if let chosenIndex: Int = deck.firstIndex(matching: card), !deck[chosenIndex].isFaceUp, !deck[chosenIndex].isMatched {
            //case to select non matched or face up cards and add them to the current selected cards list
            self.deck[chosenIndex].isFaceUp = true
            selectedCardsIndices.append(chosenIndex)
        } else if let chosenIndex: Int = deck.firstIndex(matching: card), deck[chosenIndex].isFaceUp {
            //case to deselect cards
            self.deck[chosenIndex].isFaceUp = false
            let index = selectedCardsIndices.firstIndex(of: chosenIndex)!
            selectedCardsIndices.remove(at: index)
        }
        
        if selectedCardsIndices.count == 3 {
            //if we have 3 selected cards we check if theres a match
            let firstCard = deck[selectedCardsIndices[0]]
            let secondCard = deck[selectedCardsIndices[1]]
            let thirdCard = deck[selectedCardsIndices[2]]
            if isMatch(firstCard: firstCard, secondCard: secondCard, thirdCard: thirdCard) {
                print("match!") // TODO: remove
                self.deck[selectedCardsIndices[0]].isMatched = true
                self.deck[selectedCardsIndices[1]].isMatched = true
                self.deck[selectedCardsIndices[2]].isMatched = true
            } else {
                //not match so we remove all three cards from the selected list
                print("no match!") // TODO: remove
                self.deck[selectedCardsIndices[0]].isFaceUp = false
                self.deck[selectedCardsIndices[1]].isFaceUp = false
                self.deck[selectedCardsIndices[2]].isFaceUp = false
            }
            selectedCardsIndices.removeAll()
        }
    }
    
    private func isMatch(firstCard: setCard, secondCard: setCard, thirdCard: setCard) -> Bool {
        if firstCard.symbol == secondCard.symbol && firstCard.symbol == thirdCard.symbol ||
            firstCard.color == secondCard.color && firstCard.color == thirdCard.color ||
            firstCard.shade == secondCard.shade && firstCard.shade == thirdCard.shade ||
            firstCard.number == secondCard.number && firstCard.number == thirdCard.number {
            return true
        }
        return false
    }
    
    struct setCard: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        
        var symbol: Int
        var color: Int
        var shade: Int
        var number: Int
        
        // id = shape*1000 + color*100 + shade*10 + number
        var id: Int
    }
    

    
}













//protocol Feature {
//    static var values: [Feature] { get }
//
//    static func getNextFeatures() -> [Feature]?
//}

//enum Symbol: Int, Feature {
//    case squiggle
//    case diamond
//    case oval
//    case none
//
//    static var values: [Feature] {
//        return [Symbol.squiggle, Symbol.diamond, Symbol.oval, Symbol.none]
//    }
//
//    static func getNextFeatures() -> [Feature]? {
//        return Color.values
//    }
//}
//
//enum Color: Int, Feature {
//    case red
//    case green
//    case purple
//    case none
//
//    static var values: [Feature] {
//        return [Color.red, Color.green, Color.purple, Color.none]
//    }
//
//    static func getNextFeatures() -> [Feature]? {
//        return Shade.values
//    }
//}
//
//enum Shade: Int, Feature {
//    case solid
//    case stripped
//    case outlined
//    case none
//
//    static var values: [Feature] {
//        return [Shade.solid, Shade.stripped, Shade.outlined, Shade.none]
//    }
//
//    static func getNextFeatures() -> [Feature]? {
//        return Number.values
//    }
//}
//
//enum Number: Int, Feature {
//    case one
//    case two
//    case three
//    case none
//
//    static var values: [Feature] {
//        return [Number.one, Number.two, Number.three, Number.none]
//    }
//
//    static func getNextFeatures() -> [Feature]? {
//        return nil
//    }
//}


