//
//  OtherView.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 12/09/2023.
//

import SwiftUI

struct OtherView: View {
    
    @State var fastCamera = false
    
    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    ZStack {
                        
                        Text("Other")
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
                    VStack(spacing: 14) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 45)
                                .foregroundColor(Color(red: 28/255, green: 28/255, blue: 30/255))
                            HStack {
                                Image(systemName: "camera.viewfinder")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                                
                                Text("Fast Camera (reduces quality")
                                    .foregroundColor(.white)
                                    .fontWeight(.medium)
                                    .font(.system(size: 14))
                                
                                Toggle("", isOn: $fastCamera)
                            }
                            .padding(.horizontal, UIScreen.main.bounds.width * 0.04)
                            .frame(height: 30)
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 45)
                                .foregroundColor(Color(red: 28/255, green: 28/255, blue: 30/255))
                            HStack {
                                Image(systemName: "xmark.app")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                                
                                Text("Clear cache")
                                    .foregroundColor(.white)
                                    .fontWeight(.medium)
                                    .font(.system(size: 14))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                            }
                            .padding(.horizontal, UIScreen.main.bounds.width * 0.04)
                            .frame(height: 30)
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 45)
                                .foregroundColor(Color(red: 28/255, green: 28/255, blue: 30/255))
                            HStack {
                                
                                Spacer()
                                
                                Text("Delete Account")
                                    .foregroundColor(.red)
                                
                                Spacer()
                                
                                
                            }
                            .padding(.horizontal, UIScreen.main.bounds.width * 0.04)
                            .frame(height: 30)
                        }
                        
                    }
                    .padding(.horizontal)
                    .padding(.top, 50)
                    
                    Spacer()
                }
            }
        }
    }
}

struct OtherView_Previews: PreviewProvider {
    static var previews: some View {
        OtherView()
    }
}
