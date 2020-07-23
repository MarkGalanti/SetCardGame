//
//  Array+Only.swift
//  SetGame
//
//  Created by Mark Galanti on 7/22/20.
//  Copyright © 2020 Mark Galanti. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
