//
//  CardGame.swift
//  SetGame
//
//  Created by Mark Galanti on 7/21/20.
//  Copyright © 2020 Mark Galanti. All rights reserved.
//

import Foundation

struct MatchingGame<CardContent> where CardContent: Equatable {
    private(set) var deck: Array<setCard>
    
    
    init() {
        deck = Array<setCard>()
        for shapeIndex in 0..<3 {
            for colorIndex in 0..<3 {
                for shadeIndex in 0..<3 {
                    for numberIndex in 0..<3 {
                        deck.append(setCard(shape: shapeIndex,
                                            color: colorIndex,
                                            shade: shadeIndex,
                                            number: numberIndex,
                                            id: (shapeIndex*1000 + colorIndex*100 + shadeIndex*10 + numberIndex)))
                    }
                }
            }
        }
    }
    

}
