//
//  ContentView.swift
//  4-swiftConcepts-firebaseStorage-photo
//
//  Created by Liu Ziyi on 12/8/23.
//

import SwiftUI
import FirebaseStorage

struct ContentView: View {
    
    @State var isPickerShowing = false
    @State var selectedImage: UIImage?
    
    var body: some View {
        
        VStack {
            
            if selectedImage != nil {
                Image(uiImage: selectedImage!)
                    .resizable()
                    .frame(width: 200, height: 200)
            }
            
            Button {
                // Show the image picker
                isPickerShowing = true
            } label: {
                Text("Select a Photo")
            }
            
            // Upload button
            if selectedImage != nil {
                Button {
                    // Upload the image
                    uploadPhoto()
                } label: {
                    Text("Upload photo")
                }
            }
            
        }
        .sheet(isPresented: $isPickerShowing, onDismiss: nil) {
            // Image picker
            ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
        }
        
    }
    
    func uploadPhoto() {
        
        // Make sure that the selected image property isn't nil
        guard selectedImage != nil else {
            return
        }
        
        // Create storage reference
        let storageRef = Storage.storage().reference()
        
        // Turn our image into data
        let imageData = selectedImage!.jpegData(compressionQuality: 0.8)
        
        // Check that we were able to convert it to data
        guard imageData != nil else {
            return
        }
        
        // Specify the file path and name
        let fileRef = storageRef.child("images/\(UUID().uuidString).jpg")
        
        // Upload that data
        let uploadTask = fileRef.putData(imageData!, metadata: nil) { metadata, error in
            
            // Check for errors
            if error == nil && metadata != nil {
                
                // TODO: Save a reference to the file in Firestore DB 
            }
        }
        
        // Save a reference to the file in Firestore DB
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
