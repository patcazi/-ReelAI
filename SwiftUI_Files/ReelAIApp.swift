//
//  ReelAIApp.swift
//  ReelAI
//
//  Created by Patrice Azi on 2/3/25.
//
import SwiftUI
import Firebase

@main
struct ReelAIApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
