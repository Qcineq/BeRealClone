//
//  MainAuthView.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 06/11/2023.
//

import SwiftUI

struct MainAuthView: View {
    
    @State private var nameButtonClicked = false
    @State private var ageButtonClicked = false
    @State private var phoneNumberButtonClicked = false
    
    @StateObject var viewModel = AuthViewModel()
    
    var body: some View {
        NavigationView {
            if !nameButtonClicked {
                EnterNameView(name: $viewModel.name, nameButtonClicked: $nameButtonClicked)
                    .environmentObject(viewModel)
            } else if nameButtonClicked && !ageButtonClicked {
                EnterAgeView(year: $viewModel.year, name: $viewModel.name, ageButtonClicked: $ageButtonClicked)
            } else if nameButtonClicked && ageButtonClicked && !phoneNumberButtonClicked{
                EnterPhoneNumberView(phoneNumberButtonClicked: $phoneNumberButtonClicked)
                    .environmentObject(viewModel)
            }
        }
    }
}

#Preview {
    MainAuthView()
}
