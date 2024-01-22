//
//  FeedViewModel.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 20/01/2024.
//

import SwiftUI
import Firebase

class FeedViewModel: ObservableObject {
    
    @Published var bereals = [BeReal]()
    @Published var bereal = BeReal(username: "", frontImgaeUrl: "", backImgaeUrl: "", userId: "")
    
    @Published var blur = true
    
    let user: User
    
    init(user: User) {
        let date = Date.now
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yy"
        let dateString = formatter.string(from: date)
        
        self.user = user
        
        Task {
            
            if let userId = AuthViewModel.shared.currentUser?.id {
                await fetchOwnPost(date: dateString, userId: userId)
            }
            
            await fetchData(date: dateString)
        }
        
    }
    
    func fetchData(date: String) async {
        let db = Firestore.firestore()
        
        do {
            let data = try await db.collection("posts").document(date).collection("bereals").getDocuments()
            
            self.bereals = data.documents.compactMap({ try? $0.data(as: BeReal.self) })
            
        } catch {
            print("ERROR IN fetchData in FeedViewModel")
            print(error)
        }
    }
    
    func fetchOwnPost(date: String, userId: String) async {
        let db = Firestore.firestore()
        
        do {
            let data = try await db.collection("posts").document(date).collection("bereals").document(userId).getDocument()
            self.bereal = try data.data(as: BeReal.self)
        } catch {
            print("ERROR In fetchOwnPost in FeedViewModel")
            print(error)
        }
    }
    
}
