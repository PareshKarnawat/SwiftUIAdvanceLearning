//
//  CustomTransitionsDemo.swift
//  SwiftUIAdvanceLearning
//
//  Created by Paresh  Karnawat on 04/10/25.
//

import SwiftUI

struct RotateViewModifer: ViewModifier {
    let rotation : Double
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotation))
            .offset(
                x: rotation != 0 ? UIScreen.main.bounds.width : 0,
                y: rotation != 0 ? UIScreen.main.bounds.height : 0)
    }
}

extension AnyTransition {
    static var rotating: AnyTransition {
        return AnyTransition.modifier(active: RotateViewModifer(rotation: 180), identity: RotateViewModifer(rotation: 0))
    }
    
    static func rotating(rotation: Double) -> AnyTransition {
        return AnyTransition.modifier(active: RotateViewModifer(rotation: rotation), identity: RotateViewModifer(rotation: 0))
    }
}

struct CardInfo: Identifiable {
    let id = UUID()
    let suit: SuitType
    let offset: CGFloat
}

struct CustomTransitionsDemo: View {
    @State private var shownCards: [Bool]
    private let cards: [CardInfo] = [
        CardInfo(suit: .diamond, offset: -60),
        CardInfo(suit: .club, offset: -20),
        CardInfo(suit: .heart, offset: 20),
        CardInfo(suit: .spade, offset: 60)
    ]
    init() {
        _shownCards = State(initialValue: Array(repeating: false, count: cards.count))
    }
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            LinearGradient(
                gradient: Gradient(colors: [.white.opacity(0.4), .clear]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                ZStack {
                    ForEach(Array(cards.enumerated()), id: \.element.id) { index, card in
                        if shownCards[index] {
                            AceCardView(suit: card.suit)
                                .transition(.rotating(rotation: 180))
                                .offset(x: card.offset)
                        }
                    }
                }
                Spacer()
                
                Text("Shuffle!")
                    .withButtonFormatting(backgroundColor: .cyan)
                    .font(.title)
                    .padding(.horizontal, 40)
                    .onTapGesture {
                        for i in cards.indices {
                            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.2) {
                                withAnimation(.easeInOut) {
                                    shownCards[i].toggle()
                                }
                            }
                        }
                    }
            }
        }
        .navigationTitle("Custom Transitions")
    }
}

#Preview {
    CustomTransitionsDemo()
}
