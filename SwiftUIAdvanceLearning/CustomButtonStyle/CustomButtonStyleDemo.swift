//
//  CustomButtonStyleDemo.swift
//  SwiftUIAdvanceLearning
//
//  Created by Paresh  Karnawat on 04/10/25.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    let scaledAmount: CGFloat
    
    init(scaledAmount: CGFloat) {
        self.scaledAmount = scaledAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
//            .brightness(configuration.isPressed ? 0.05 : 0)
            .opacity(configuration.isPressed ? 0.5 : 1.0)
    }
}

extension View {
    func withPressableStyle(scaledAmount: CGFloat = 0.9) -> some View {
        buttonStyle(PressableButtonStyle(scaledAmount: scaledAmount))
    }
}

struct CustomButtonStyleDemo: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [.white.opacity(0.4), .clear]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .ignoresSafeArea()
                )
            
            Button {} label: {
                Text("Click here")
                    .withButtonFormatting(backgroundColor: .purple)
            }
            .withPressableStyle(scaledAmount: 1.2)
            //        .buttonStyle(PressableButtonStyle())
            .padding(40)
        }
        .navigationTitle("Custom Button Style")
    }
}

#Preview {
    CustomButtonStyleDemo()
}
