//
//  EditProfile.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 05/09/2023.
//

import SwiftUI

struct EditProfile: View {
    
    @State var width = UIScreen.main.bounds.width
    
    @State var fullName = ""
    @State var userName = ""
    @State var bio = ""
    @State var location = ""
    
    
    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                //MARK: - Navigation buttons
                
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
                            .opacity(0.3)
                    }
                    Spacer()
                }
                
                //MARK: - Profile photo
                
                VStack {
                    VStack {
                        ZStack(alignment: .bottomTrailing) {
                            Image("profilePhoto")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 120)
                                .cornerRadius(60)
                            
                            ZStack {
                                ZStack {
                                    Circle()
                                        .frame(width: 34, height: 34)
                                        .foregroundColor(.black)
                                    Circle()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.white)
                                    Circle()
                                        .frame(width: 34, height: 34)
                                        .foregroundColor(.black)
                                        .opacity(0.1)
                                }
                                Image(systemName: "camera.fill")
                                    .font(.system(size: 16))
                                    .shadow(color: .white, radius: 1, x: 1, y: 1)
                            }
                        }
                    }
                    
                    //MARK: - MENU
                    
                    VStack {
                        Rectangle()
                            .frame(width: width * 0.9, height: 0.7)
                            .foregroundColor(.gray)
                            .opacity(0.3)
                        
                        HStack {
                            HStack {
                                Text("Full Name")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16))
                                Spacer()
                            }
                            .frame(width: width * 0.22)
                            
                            HStack {
                                TextField("", text: $fullName)
                                    .font(.system(size: 16))
                                    .placeholder(when: fullName.isEmpty) {
                                        Text("Kuba").foregroundColor(.white)
                                            .font(.system(size: 16))
                                    }
                                    .foregroundColor(.white)
                                    .padding(.leading, width * 0.05)
                                Spacer()
                                
                            }
                            .frame(width: width * 0.63)
                        }
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
