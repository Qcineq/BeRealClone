//
//  FeedCell.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 29/08/2023.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    
    var bereal: BeReal
    var blur: Bool
    
    @ObservedObject var viewModel: FeedCellViewModel
    
    init(bereal: BeReal, blur: Bool, viewModel: FeedCellViewModel) {
        self.bereal = bereal
        self.blur = blur
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                
                HStack {
                    
                    if let userUrl = viewModel.beReal.user?.profileImageUrl {
                        KFImage(URL(string: userUrl))
                            .resizable()
                            .frame(width: 40, height: 40)
                            .cornerRadius(20)
                    } else {
                        Circle()
                            .frame(width: 40, height: 40)
                            .cornerRadius(20)
                            .foregroundColor(Color(red: 152/255, green: 163/255, blue: 16/255))
                            .overlay(
                                
                                Text(viewModel.beReal.username.prefix(1).uppercased())
                                    .foregroundStyle(.white)
                                    .font(.system(size: 18))
                            )
                    }
                    
//                    Image("profilePhoto")
//                        .resizable()
//                        .frame(width: 40, height: 40)
//                        .cornerRadius(20)
                    
                    VStack(alignment: .leading) {
                        if let user = viewModel.beReal.user {
                            Text(user.name)
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .font(.system(size: 16))
                        }
                        
                        Text("Warsaw • 7 hr late")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                    }
                    
                    Spacer()
                    
                    ThreeDots(size: 4, color: .gray)
                    
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    ZStack {
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
                            
                            VStack(alignment: .leading) {
                                
                                KFImage(URL(string: bereal.backImgaeUrl))
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width)
                                    .scaledToFit()
                                    .cornerRadius(20)
                            }
                            
                            GeometryReader { g in
                                VStack {
                                    HStack {
                                        KFImage(URL(string: bereal.frontImgaeUrl))
                                            .resizable()
                                            .scaledToFit()
                                            .cornerRadius(8)
                                            .frame(height: 160)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(.black, lineWidth: 3)
                                            )
                                            .padding(.leading)
                                        Spacer()
                                    }
                                }.padding(.top, 18)
                                Spacer()
                            }
                        }
                        .blur(radius: blur ? 8 : 0)
                        
                        if blur {
                            VStack {
                                Image(systemName: "eye.slash.fill")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 30))
                                Text("Post to view")
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                                    .padding(.top, 4)
                                Text("To view your friends BeReal, share yours with them.")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 14))
                                    .padding(.top, -4)
                                
                                RoundedRectangle(cornerRadius: 12)
                                    .foregroundStyle(.white)
                                    .frame(width: 180, height: 40)
                                    .overlay(
                                        Text("Post a Late BeReal")
                                            .foregroundStyle(.black)
                                            .font(.system(size: 12))
                                    )
                                    .padding(.top, 6)
                            }
                        }
                        
                    }
                    
                    Text(blur ? "" : "Add a comment...")
                        .foregroundStyle(.gray)
                        .fontWeight(.semibold)
                        .padding(.leading, 4)
                    
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: 600)
        }
    }
}

//struct FeedCell_Previews: PreviewProvider {
//    static var previews: some View {
//        FeedCell()
//    }
//}
