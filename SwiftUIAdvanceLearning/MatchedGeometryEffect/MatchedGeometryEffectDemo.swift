//
//  MatchedGeometryEffectDemo.swift
//  SwiftUIAdvanceLearning
//
//  Created by Paresh  Karnawat on 05/10/25.
//

import SwiftUI

struct MatchedGeometryEffectDemo: View {
    let categories: [String] = ["Home","Favourite", "Save"]
    let imagesName: [String] = ["house.fill","heart.fill", "square.and.arrow.down.fill"]
    @State private var selected: String = ""
    @Namespace private var namespace2
    
    @State private var isClicked : Bool = false
    @Namespace private var namespace
    
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
                if !isClicked {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.blue)
                        .matchedGeometryEffect(id: "rectangle", in: namespace)
                        .frame(width:100, height: 100)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                isClicked.toggle()
                            }
                        }
                }
                Spacer()
                
                if isClicked {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.red)
                        .matchedGeometryEffect(id: "rectangle", in: namespace)
                        .frame(width:300, height: 200)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                isClicked.toggle()
                            }
                        }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            
            HStack {
                ForEach(Array(categories.enumerated()), id:\.offset) {
                    index, category in
                    ZStack {
                        if selected == category {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.cyan)
                                .matchedGeometryEffect(id: "categoryBackground", in: namespace2)
                        }
                        HStack{
                            Image(systemName: imagesName[index])
                            Text(category)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .frame(height: 55)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation(.spring()){
                            selected = category
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Matched Geometry Effect")
    }
}

#Preview {
    MatchedGeometryEffectDemo()
}
