//
//  Feed.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 29/08/2023.
//

import SwiftUI
import Kingfisher

struct FeedView: View {
    
    @Binding var mainMenu: String
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @ObservedObject var feedModel: FeedViewModel
    
    @State var cameraViewPresented = false
    
    init(feedModel: FeedViewModel, menu: Binding<String>) {
        self.feedModel = feedModel
        self._mainMenu = menu
    }
    
    var body: some View {
        
        VStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                ZStack {
                    
                    ScrollView {
                        VStack {
                            VStack {
                                ZStack {
                                    VStack(alignment: .leading) {
                                        Image("mainCam")
                                            .resizable()
                                            .scaledToFit()
                                            .cornerRadius(5)
                                    }
                                    
                                    VStack {
                                        HStack {
                                            Image("frontCam")
                                                .resizable()
                                                .scaledToFit()
                                                .border(.black)
                                                .cornerRadius(2)
                                                .frame(width: 20, height: 40)
                                                .padding(.leading)
                                            Spacer()
                                        }
                                        .padding(.top, 18)
                                        Spacer()
                                    }
                                }
                                .frame(width: 100)
                            }
                            
                            VStack {
                                Text("Add a caption...")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                                Text("View Comment")
                                    .foregroundColor(.gray)
                                
                                HStack {
                                    Text("Warszawa, Bemowo • 1 hr late")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12))
                                    ThreeDots(size: 3, color: .gray)
                                }
                            }
                            
                            ForEach(self.feedModel.bereals, id: \.backImgaeUrl) { bereal in
                                
                                FeedCell(bereal: bereal, blur: feedModel.blur, viewModel: FeedCellViewModel(beReal: bereal))
                                    .onAppear {
                                        print("BEREAL: \(bereal.username)")
                                    }
                                
                            }
                        }
                        .padding(.top, 80)
                    }
                    
                    VStack {
                        VStack {
                            HStack {
                                
                                Button {
                                    withAnimation {
                                        self.mainMenu = "left"
                                    }
                                } label: {
                                    Image(systemName: "person.2.fill")
                                        .foregroundColor(.white)
                                }
                                
                                Spacer()
                                
                                Text("BeReal.")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 22))
                                
                                Spacer()
                                
                                Button {
                                    withAnimation {
                                        self.mainMenu = "profile"
                                    }
                                } label: {
                                    
                                    if let profileImageUrl = viewModel.currentUser?.profileImageUrl {
                                        KFImage(URL(string: profileImageUrl))
                                            .resizable()
                                            .frame(width: 35, height: 35)
                                            .cornerRadius(17.5)
                                    } else {
                                        Circle()
                                            .frame(width: 35, height: 35)
                                            .cornerRadius(17.5)
                                            .foregroundColor(Color(red: 152/255, green: 163/255, blue: 16/255))
                                            .overlay(
                                                
                                                Text(viewModel.currentUser?.name.prefix(1).uppercased() ?? "X")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 15))
                                            )
                                    }
                                    
//                                Image("profilePhoto")
//                                    .resizable()
//                                    .frame(width: 35, height: 35)
//                                    .cornerRadius(17.5)
                                }
                            }
                            .padding(.horizontal)
                            
                            HStack {
                                Text("My Friends")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                                
                                Text("Discovery")
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        Spacer()
                        
                        HStack {
                            VStack {
                                Image(systemName: "circle")
                                    .font(.system(size: 80))
                                Text("Post a late BeReal.")
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                            }
                            .foregroundColor(.white)
                            .padding(.bottom, 12)
                            .onTapGesture {
                                self.cameraViewPresented.toggle()
                            }
                        }
                    }
                }
            }
            .onAppear {
                KingfisherManager.shared.cache.clearMemoryCache()
            }
            
        }
        .fullScreenCover(isPresented: $cameraViewPresented, onDismiss: {
             
        }, content: {
            CameraView(viewModel: CameraViewModel(user: AuthViewModel.shared.currentUser!))
        })
    }
}

//struct Feed_Previews: PreviewProvider {
//    static var previews: some View {
//        FeedView(mainMenu: .constant("feed"))
//    }
//}
