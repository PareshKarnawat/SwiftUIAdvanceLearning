//
//  SwiftUIAdvanceLearningApp.swift
//  SwiftUIAdvanceLearning
//
//  Created by Paresh  Karnawat on 03/10/25.
//

import SwiftUI

@main
struct SwiftUIAdvanceLearningApp: App {
    init() {
            let appearance = UINavigationBarAppearance()
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                SwiftUIViewModifier()
            }
        }
    }
}
