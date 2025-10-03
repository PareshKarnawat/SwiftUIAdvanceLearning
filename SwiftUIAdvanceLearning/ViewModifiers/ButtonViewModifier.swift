//
//  ButtonViewModifier.swift
//  SwiftUIAdvanceLearning
//
//  Created by Paresh  Karnawat on 03/10/25.
//

import Foundation
import SwiftUI

struct ButtonViewModifier: ViewModifier {
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
    }
}

extension View {
    func withButtonFormatting(backgroundColor: Color = .blue) -> some View {
        modifier(ButtonViewModifier(backgroundColor: backgroundColor))
    }
}
