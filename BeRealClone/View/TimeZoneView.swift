//
//  TimeZoneView.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 06/09/2023.
//

import SwiftUI

struct TimeZoneView: View {
    var body: some View {
        ZStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    ZStack {
                        Text("Time Zone")
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
                    VStack {
                        HStack {
                            Text("Select your Time Zone")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                            
                            Spacer()
                        }
                        
                        HStack {
                            Text("To receive your BeReal notification during daytime, select your time zone. When changing your time zone, your current BeReal will be deleted. You can only change time zones once a day.")
                                .foregroundColor(.white)
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                            
                            Spacer()
                        }
                        .padding(.top, -8)
                    }
                    
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 14)
                                .frame(width: UIScreen.main.bounds.width * 0.9, height: 190)
                                .foregroundColor(Color.white)
                                .opacity(0.07)
                            
                            VStack {
                                Button {
                                    
                                } label: {
                                    HStack {
                                        Image(systemName: "globe.europe.africa.fill")
                                            .foregroundColor(.white)
                                        
                                        Text("Europe")
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "checkmark.circle")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14))
                                    }
                                    .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                                    .frame(height: 30)
                                }
                                
                                HStack {
                                    
                                    Spacer()
                                    
                                    Rectangle()
                                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 0.3)
                                        .opacity(0.4)
                                        .foregroundColor(.gray)
                                }
                                
                                Button {
                                    
                                } label: {
                                    HStack {
                                        Image(systemName: "globe.americas.fill")
                                            .foregroundColor(.white)
                                        
                                        Text("Americas")
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "checkmark.circle")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14))
                                    }
                                    .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                                    .frame(height: 30)
                                }
                                
                                HStack {
                                    
                                    Spacer()
                                    
                                    Rectangle()
                                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 0.3)
                                        .opacity(0.4)
                                        .foregroundColor(.gray)
                                }
                                
                                Button {
                                    
                                } label: {
                                    HStack {
                                        Image(systemName: "globe.asia.australia.fill")
                                            .foregroundColor(.white)
                                        
                                        Text("East Asia")
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "checkmark.circle")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14))
                                    }
                                    .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                                    .frame(height: 30)
                                }
                                HStack {
                                    
                                    Spacer()
                                    
                                    Rectangle()
                                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 0.3)
                                        .opacity(0.4)
                                        .foregroundColor(.gray)
                                }
                                
                                Button {
                                    
                                } label: {
                                    HStack {
                                        Image(systemName: "globe.asia.australia.fill")
                                            .foregroundColor(.white)
                                        
                                        Text("West Asia")
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "checkmark.circle")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14))
                                    }
                                    .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                                    .frame(height: 30)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct TimeZoneView_Previews: PreviewProvider {
    static var previews: some View {
        TimeZoneView()
    }
}