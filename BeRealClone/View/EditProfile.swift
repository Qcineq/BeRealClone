//
//  EditProfile.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 05/09/2023.
//

import SwiftUI

struct EditProfile: View {
    
    @State var width = UIScreen.main.bounds.width
    
    
    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    ZStack {
                        HStack {
                            Text("Cancel")
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Text("Save")
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal, width * 0.05)
                        
                        Text("Edit Profile")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                    HStack {
                        Spacer()
                        Rectangle()
                            .frame(width: width * 0.95, height: 0.7)
                            .foregroundColor(.gray)
                        .opacity(0.5)
                    }
                }
            }
        }
    }
}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile()
    }
}
