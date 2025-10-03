//
//  SwiftUIViewModifier.swift
//  SwiftUIAdvanceLearning
//
//  Created by Paresh  Karnawat on 03/10/25.
//

import SwiftUI

struct SwiftUIViewModifier: View {
    var body: some View {
        VStack(spacing: 20){
              Button("Hello, Geen!") {
                // Add action here
            }
            .font(.headline)
            .withButtonFormatting(backgroundColor: .green)
            
            Button("Hello, Orange!") {
                // Add action here
            }
            .font(.subheadline)
            .withButtonFormatting(backgroundColor: .orange)
            
            Button("Hello, Red!") {
                // Add action here
            }
            .font(.title)
            .withButtonFormatting(backgroundColor: .red)
            
            Button("Hello Blue!!") {
                // Add action here
            }
            .font(.title3)
            .withButtonFormatting()
        }
        .padding()
    }
}

#Preview {
    SwiftUIViewModifier()
}
