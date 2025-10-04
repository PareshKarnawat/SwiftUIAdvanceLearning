//
//  SwiftUIAdvanceLearning.swift
//  SwiftUIAdvanceLearning
//
//  Created by Paresh  Karnawat on 04/10/25.
//

import SwiftUI

struct SwiftUIAdvanceLearning: View {
    
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
            
            NavigationStack {
                ZStack {
                    List {
                        NavigationLink("ViewModifier Demo") {
                            ViewModifierDemo()
                        }
                        NavigationLink("Custom Button Style Demo") {
                            CustomButtonStyleDemo()
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .listStyle(.insetGrouped)
                }
                .navigationTitle("SwiftUI")
                .navigationSubtitle("Advance Learning")
            }
        }
    }
}

#Preview {
    SwiftUIAdvanceLearning()
}
