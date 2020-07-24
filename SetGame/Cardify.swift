//
//  Cardify.swift
//  SetGame
//
//  Created by Mark Galanti on 7/22/20.
//  Copyright © 2020 Mark Galanti. All rights reserved.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    var isSelected: Bool
    
    init(isSelected: Bool) {
        self.isSelected = isSelected
    }
    
    func body(content: Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: connerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: connerRadius).stroke(lineWidth: edgeLineWidth)
                content.padding(5)
            }.opacity(isSelected ? 0 : 1)
            Group{
                RoundedRectangle(cornerRadius: connerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: connerRadius).stroke(lineWidth: edgeLineWidth).fill(Color.orange)
                content.padding(8)
            }.opacity(isSelected ? 1 : 0)
        }
    }
    private let connerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
}

extension View {
    func cardify(isSelected: Bool) -> some View {
        self.modifier(Cardify(isSelected: isSelected))
    }
}
