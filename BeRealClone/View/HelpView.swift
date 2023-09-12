//
//  HelpView.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 12/09/2023.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        VStack {
            ZStack {
                
                Color.black.ignoresSafeArea()
                
                VStack {
                    ZStack {
                        
                        Text("Help")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                        
                        HStack {
                            Image(systemName: "arrow.backward")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                            
                            Spacer()
                        }
                    }
                    
                    Spacer()
                }
                
                VStack {
                    
                    VStack(spacing: 16) {
                        
                        ChevronButtonView(icon: "envelope", text: "Contac us")
                        
                        ChevronButtonView(icon: "questionmark.circle", text: "Help Center")
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top, 50)
                }                
            }
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
