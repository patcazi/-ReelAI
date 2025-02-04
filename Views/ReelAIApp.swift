import SwiftUI
import FirebaseCore

@main
struct ReelAIApp: App {
    
    // Initialize Firebase in the app's initializer
    init() {
        // Make sure Firebase is configured once
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
    }
    
    var body: some Scene {
        WindowGroup {
            // For now, let's just show the LoginView. 
            // You can change this to SignUpView or any conditional logic later.
            LoginView()
        }
    }
}