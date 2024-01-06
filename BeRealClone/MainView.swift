//
//  MainView.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 06/01/2024.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                MainAuthView()
            }
            else {
                ContentView()
            }
        }
    }
}

#Preview {
    MainView()
}
