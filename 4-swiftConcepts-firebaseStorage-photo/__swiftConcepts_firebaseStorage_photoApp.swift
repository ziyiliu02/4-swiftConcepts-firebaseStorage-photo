//
//  __swiftConcepts_firebaseStorage_photoApp.swift
//  4-swiftConcepts-firebaseStorage-photo
//
//  Created by Liu Ziyi on 12/8/23.
//

import SwiftUI
import Firebase

@main
struct __swiftConcepts_firebaseStorage_photoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    init() {
        FirebaseApp.configure()
    }
}
