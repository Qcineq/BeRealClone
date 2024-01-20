//
//  CameraViewModel.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 20/01/2024.
//

import SwiftUI
import Firebase
import FirebaseFirestore

class CameraViewModel: ObservableObject {
    
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func takePhoto(backImage: UIImage, frontImage: UIImage, completion: @escaping(String, String) -> Void) {
        ImageUploader.uploadImage(image: backImage, type: .post) { urlBackImage in
            ImageUploader.uploadImage(image: frontImage, type: .post) { urlFrontImage in
                completion(urlBackImage, urlFrontImage)
            }
        }
    }
    
    func postBeReal(frontImageUrl: String, backImageUrl: String) async {
        
        let db = Firestore.firestore()
        
        let date = Date.now
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dd-MM-yy"
        
        let dateString = formatter.string(from: date)
        print(dateString)
        
        do {
            try await db.collection("post").document("\(dateString)").collection("bereals").document(user.id!)
                .setData([
                    "frontImageUrl" : frontImageUrl,
                    "backImageUrl" : backImageUrl,
                    "userId" : user.id,
                    "username" : user.name
                    
                ])
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
