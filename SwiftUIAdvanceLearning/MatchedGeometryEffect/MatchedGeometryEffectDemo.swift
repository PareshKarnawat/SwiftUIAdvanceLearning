//
//  MatchedGeometryEffectDemo.swift
//  SwiftUIAdvanceLearning
//
//  Created by Paresh  Karnawat on 05/10/25.
//

import SwiftUI

struct MatchedGeometryEffectDemo: View {
    
    @State private var isClicked : Bool = false
    @Namespace private var namespace
    
    var body: some View {
        VStack {
            if !isClicked {
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width:100, height: 100)
                    
            }
            Spacer()
            
            if isClicked {
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width:300, height: 200)
                    
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.cyan)
        .onTapGesture {
            withAnimation(.easeInOut) {
                isClicked.toggle()
            }
        }
    }
}

struct MatchedGeometryEffectExample2: View {
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
                        .matchedGeometryEffect(id: "rectangle", in: namespace)
                        .frame(width:100, height: 100)
                        
                }
                Spacer()
                
                if isClicked {
                    RoundedRectangle(cornerRadius: 25)
                        .matchedGeometryEffect(id: "rectangle", in: namespace)
                        .frame(width:300, height: 200)
                        
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.cyan)
            .onTapGesture {
                withAnimation(.easeInOut) {
                    isClicked.toggle()
                }
            }
            
            HStack {
                ForEach(Array(categories.enumerated()), id:\.offset) {
                    index, category in
                    ZStack {
                        if selected == category {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.cyan.opacity(0.5))
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
                    .onTapGesture {
                        withAnimation(.spring()){
                            selected = category
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    MatchedGeometryEffectExample2()
}
