//
//  ContentView.swift
//  4-swiftConcepts-firebaseStorage-photo
//
//  Created by Liu Ziyi on 12/8/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var isPickerShowing = false
    
    var body: some View {
        
        VStack {
            
            Button {
                // Show the image picker
                isPickerShowing = true
            } label: {
                Text("Select a Photo")
            }
            
        }
        .sheet(isPresented: $isPickerShowing, onDismiss: nil) {
            // Image picker 
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
