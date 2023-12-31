//
//  FeedCell.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 29/08/2023.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                
                HStack {
                    Image("profilePhoto")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .cornerRadius(20)
                    
                    VStack(alignment: .leading) {
                        Text("Qcineq")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .font(.system(size: 16))
                        
                        Text("Warsaw • 7 hr late")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                    }
                }
                .padding(.horizontal)
                
                ZStack {
                    
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            VStack {
                                Image(systemName: "bubble.left.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25))
                                    .shadow(color: .black, radius: 3, x: 1, y: 1)
                                
                                Image(systemName: "face.smiling.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25))
                                    .shadow(color: .black, radius: 3, x: 1, y: 1)
                                    .padding(.top, 15)
                            }
                            .padding(.trailing, 20)
                            .padding(.bottom, 50)
                        }
                    }
                    .zIndex(1)
                    
                    VStack {
                        Image("mainCam")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(20)
                        
                        HStack {
                            Text("Add a comment...")
                                .foregroundColor(.gray)
                                .fontWeight(.semibold)
                            .padding(.leading, 8)
                            
                            Spacer()
                        }
                    }
                    
                    VStack {
                        HStack {
                            RoundedRectangle(cornerRadius: 10 )
                                .foregroundColor(.black)
                                .frame(width: 125, height: 165)
                                .overlay(
                                    Image("frontCam")
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(8)
                                        .frame(width: 120, height: 160)
                                )
                                .padding(.leading)
                            
                            Spacer()
                        }
                        .padding(.top, 18)
                        
                        Spacer()
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: 600)
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
