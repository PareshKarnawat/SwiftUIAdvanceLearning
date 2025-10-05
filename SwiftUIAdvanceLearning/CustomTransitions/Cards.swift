//
//  Cards.swift
//  SwiftUIAdvanceLearning
//
//  Created by Paresh  Karnawat on 04/10/25.
//

import SwiftUI

enum SuitType {
    case spade, diamond, club, heart
    
    var color: Color {
        switch self {
        case .spade, .club: return .black
        case .diamond, .heart: return .red
        }
    }
    
    var symbol: String {
        switch self {
        case .spade: return "♠"
        case .diamond: return "♦"
        case .club: return "♣"
        case .heart: return "♥"
        }
    }
}

// MARK: - 2. Reusable Card View

struct AceCardView: View {
    let suit: SuitType
    
    private let cardWidth: CGFloat = 250
    private let cardHeight: CGFloat = 350
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .frame(width: cardWidth, height: cardHeight)
                .shadow(radius: 5)
            
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black.opacity(0.8), lineWidth: 3)
                .frame(width: cardWidth, height: cardHeight)
            
            Text(suit.symbol)
                .font(.system(size: 100, weight: .regular))
                .foregroundColor(suit.color)
                .scaleEffect(suit == .spade ? 1.2 : 1.0)
            
            VStack(alignment: .leading, spacing: -10) {
                Text("A")
                    .font(.system(size: 40, weight: .heavy))
                Text(suit.symbol)
                    .font(.system(size: 40))
            }
            .foregroundColor(suit.color)
            .padding(20)
            .frame(width: cardWidth, height: cardHeight, alignment: .topLeading)
            
            // Bottom-right (no rotation)
            VStack(alignment: .trailing, spacing: -10) {
                Text("A")
                    .font(.system(size: 40, weight: .heavy))
                Text(suit.symbol)
                    .font(.system(size: 40))
            }
            .foregroundColor(suit.color)
            .padding(20)
            .frame(width: cardWidth, height: cardHeight, alignment: .bottomTrailing)
        }
    }
}
