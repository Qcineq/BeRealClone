//
//  AuthViewModel.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 06/11/2023.
//

import SwiftUI

class AuthViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var year = Year(day: "", month: "", year: "")
    @Published var country = "PL"
    @Published var phoneNumber = ""
    
    @Published var otpText = ""
    
    @Published var navigationTag: String?
    
    func sendOtp() {
        self.navigationTag = "VERIFICATION"
    }
}
