//
//  AuthViewModel.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 06/11/2023.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var year = Year(day: "", month: "", year: "")
    @Published var country = "+48"
    @Published var phoneNumber = ""
    
    @Published var otpText = ""
    
    @Published var navigationTag: String?
    
    @Published var isLoading: Bool = false
    @Published var verificationCode: String = ""
    
    @Published var errorMessage = ""
    @Published var showAlert = false
    
    @Published var userSession: Firebase.User?
    @Published var currentUser: User?
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func sendOtp() async {
        
        if isLoading { return }
        
        do {
            isLoading = true
            let result = try await PhoneAuthProvider.provider().verifyPhoneNumber("\(country)\(phoneNumber)", uiDelegate: nil)
            DispatchQueue.main.async {
                self.isLoading = false
                self.verificationCode = result
                self.navigationTag = "VERIFICATION"
            }
        } catch {
            handleError(error: error.localizedDescription)
        }
    }
    
    func handleError(error: String) {
        DispatchQueue.main.async {
            self.isLoading = false
            self.errorMessage = error
            self.showAlert.toggle()
        }
    }
    
    func verifyOTP()async {
        do {
            isLoading = true
            let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationCode, verificationCode: otpText)
            
            let result = try await Auth.auth().signIn(with: credential)
            
            let db = Firestore.firestore()
            
            db.collection("users").document(result.user.uid).setData([
                "name" : name,
                "date" : year.date,
                "id" : result.user.uid,
                "phone" : "\(country)\(phoneNumber)"
            ]) { err in
                if let err = err {
                    print(err.localizedDescription)
                }
            }
            
            DispatchQueue.main.async { [self] in
                self.isLoading = false
                let user = result.user
                self.userSession = user
                self.currentUser = User(name: name, date: year.date, phone: "\(country)\(phoneNumber)")
                print(user.uid)
            }
        }
        catch {
            print("ERROR in AuthViewModel")
            print(error)
//            handleError(error: error.localizedDescription)
        }
    }
    
    func signOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, err in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user
            print("ERROR")
            print(user)
            
        }
    }
    
    func saveUserData(data: [String : Any]) async {
        guard let userId = userSession?.uid else { return }
        
        do {
           try await Firestore.firestore().collection("users").document(userId).updateData(data as [String: Any])
        }
        catch {
            handleError(error: error.localizedDescription)
        }
    }
    
    func uploadProfileImage(image: UIImage, completion: @escaping(String) -> Void) {
        ImageUploader.uploadImage(image: image, type: .profile) { url in
            completion(url)
        }
    }
}
