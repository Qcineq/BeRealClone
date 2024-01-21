//
//  User.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 06/01/2024.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Decodable, Identifiable {
    @DocumentID var id: String?
    var username: String?
    var profileImageUrl: String?
    var name: String
    var date: String
    var bio: String?
    var location: String?
    var phone: String
    
    var isCurrentUser: Bool {
        return AuthViewModel.shared.userSession?.uid == id
    }
}
