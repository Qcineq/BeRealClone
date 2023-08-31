//
//  MemoryView.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 31/08/2023.
//

import SwiftUI

struct MemoryView: View {
    
    var day: Int
    
    var body: some View {
        VStack {
            ZStack {
                
                Text("\(day)")
                    .foregroundColor(.white)
                    .zIndex(1)
                
                Image("mainCam")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width / 8, height: 70)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(.white, lineWidth: 1.5)
                            .frame(width: UIScreen.main.bounds.width / 8, height: 70)
                    )
            }
        }
    }
}

struct MemoryView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryView(day: 12)
    }
}
