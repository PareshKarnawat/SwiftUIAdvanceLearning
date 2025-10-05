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
    
    let categories2: [String] = ["Book","Movie", "Sport"]
    let imagesName2: [String] = ["book.fill","movieclapper.fill", "figure.disc.sports"]
    
    @State private var selected: String = ""
    @State private var selected2: String = ""
    @Namespace private var namespace2
    @Namespace private var namespace3
    
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
            VStack{
                
                Spacer()
                
                VStack{
                    HStack {
                        ForEach(Array(categories.enumerated()), id:\.offset) {
                            index, category in
                            ZStack {
                                if selected == category {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.orange)
                                        .matchedGeometryEffect(id: "categoryBackground", in: namespace3)
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
                    
                    Spacer()
                        .frame(height: 20)
                    
                    HStack {
                        ForEach(Array(categories2.enumerated()), id:\.offset) {
                            index, category in
                            ZStack(alignment: .bottom){
                                if selected2 == category {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.yellow)
                                        .matchedGeometryEffect(id: "categoryBackground", in: namespace2)
                                        .frame(height:2)
                                        .offset(y: 15)
                                }
                                HStack{
                                    Image(systemName: imagesName2[index])
                                    Text(category)
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color.white)
                            .frame(height: 55)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation(.spring()){
                                    selected2 = category
                                }
                            }
                        }
                    }
                    .padding()
                    Spacer()
                       
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
                }
            }
        }
        .navigationTitle("Matched Geometry Effect")
    }
}

#Preview {
    MatchedGeometryEffectDemo()
}
