//
//  Settings.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 03/09/2023.
//

import SwiftUI

struct Settings: View {
    
    @State var width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    ZStack{
                        Text("Settings")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                        
                        HStack {
                            Image(systemName: "arrow.backward")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                            
                            Spacer()
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                
                VStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: width * 0.9, height: 90)
                        .foregroundColor(.white)
                        .opacity(0.07)
                        .overlay(
                            
                            HStack {
                                Image("profilePhoto")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(30)
                                
                                VStack(alignment: .leading) {
                                    Text("Kuba")
                                        .foregroundColor(.white)
                                        .fontWeight(.semibold)
                                        .font(.system(size: 18))
                                    
                                    Text("Kuucin")
                                        .foregroundColor(.white)
                                        .fontWeight(.semibold)
                                        .font(.system(size: 14))
                                }
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                                .padding(.horizontal, 18)
                        )
                    
                    VStack(spacing: 6) {
                        HStack {
                            Text("FEATURES")
                                .foregroundColor(.gray)
                                .fontWeight(.semibold)
                                .font(.system(size: 12))
                                .padding(.horizontal, width * 0.05)
                            
                            Spacer()
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: width * 0.9, height: 45)
                                .foregroundColor(.white)
                                .opacity(0.07)
                            
                            HStack {
                                Image(systemName: "calendar")
                                    .foregroundColor(.white)
                                
                                Text("Memories")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14))
                            }
                            .padding(.horizontal, width * 0.1)
                            .frame(height: 30)
                        }
                    }
                    .padding(.top, 12)
                    
                    VStack {
                        HStack {
                            Text("SETTINGS")
                                .foregroundColor(.gray)
                                .fontWeight(.semibold)
                                .font(.system(size: 12))
                                .padding(.horizontal, width * 0.05)
                            
                            Spacer()
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 14)
                                .frame(width: width * 0.9, height: 145)
                                .foregroundColor(.white)
                            .opacity(0.07)
                            
                            HStack {
                                Image(systemName: "square.and.pencil")
                                    .foregroundColor(.white)
                                
                                Text("Notifications")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14))
                            }
                            .padding(.horizontal, width * 0.1)
                            .frame(height: 30)
                        }
                    }
                }
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
