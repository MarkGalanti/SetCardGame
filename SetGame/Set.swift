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
    private(set) var indexOfTopDeck: Int
//    private(set) var score: Int

    
    init() {
        deck = Array<setCard>()
        indexOfTopDeck = 0
//        score = 0

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
        self.deck[indexOfTopDeck].inPlay = true
        indexOfTopDeck += 1
        }
    }
    
    
    mutating func dealThree(deck: Array<setCard>) {
        for _ in 0..<3 {
            if indexOfTopDeck >= 81 {
            return // TODO: Shouldn't get here need some restriction
            }
            self.deck[indexOfTopDeck].inPlay = true
            indexOfTopDeck += 1
        }
    }

    
    mutating func choose(card: setCard) {
        // choose, if not third chosen, mark seen then do nothing -- need func to check
        // if third chosen check if matching, then change isMatched to true
        if let chosenIndex: Int = deck.firstIndex(matching: card), !deck[chosenIndex].isSelected, !deck[chosenIndex].isMatched {
            //case to select non matched or face up cards and add them to the current selected cards list
            self.deck[chosenIndex].isSelected = true
        } else if let chosenIndex: Int = deck.firstIndex(matching: card), deck[chosenIndex].isSelected {
            //case to deselect cards
            self.deck[chosenIndex].isSelected = false
        }
        let selectedCards = deck.filter({$0.isSelected == true})
        if selectedCards.count >= 3 {
            //if we have 3 selected cards we check if theres a match
            if isMatch(firstCard: selectedCards[0], secondCard: selectedCards[1], thirdCard: selectedCards[2]) {
                print("match!") // TODO: remove
                self.deck[deck.firstIndex(matching: selectedCards[0])!].isMatched = true
                self.deck[deck.firstIndex(matching: selectedCards[1])!].isMatched = true
                self.deck[deck.firstIndex(matching: selectedCards[2])!].isMatched = true

                self.deck[deck.firstIndex(matching: selectedCards[0])!].inPlay = false
                self.deck[deck.firstIndex(matching: selectedCards[1])!].inPlay = false
                self.deck[deck.firstIndex(matching: selectedCards[2])!].inPlay = false
                dealThree(deck: self.deck)
            } else {
                //not match so we remove all three cards from the selected list
                print("no match!") // TODO: remove
            }
                self.deck[deck.firstIndex(matching: selectedCards[0])!].isSelected = false
                self.deck[deck.firstIndex(matching: selectedCards[1])!].isSelected = false
                self.deck[deck.firstIndex(matching: selectedCards[2])!].isSelected = false
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
        var isSelected: Bool = false
        var isMatched: Bool = false
        var inPlay: Bool = false
        
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


