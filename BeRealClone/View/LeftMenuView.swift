//
//  LeftMenuView.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 10/09/2023.
//

import SwiftUI

struct LeftMenuView: View {
    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                LeftMenuTopView()
                
                Suggestions()
            }
        }
    }
}

struct LeftMenuView_Previews: PreviewProvider {
    static var previews: some View {
        LeftMenuView()
    }
}
