//
//  EditProfile.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 05/09/2023.
//

import SwiftUI

struct EditProfile: View {
    
    @State var width = UIScreen.main.bounds.width
    
    @State var fullName: String
    @State var userName: String
    @State var bio: String
    @State var location: String
    
    @Environment(\.dismiss) var dismiss
    
    let currentUser: User
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State var imagePickerPresented = false
    
    @State private var selectedImage: UIImage?
    @State var profileImage: Image?
    
    init(currentUser: User) {
        self.currentUser = currentUser
        self._fullName = State(initialValue: currentUser.name)
        self._bio = State(initialValue: currentUser.bio ?? "")
        self._userName = State(initialValue: currentUser.username ?? "")
        self._location = State(initialValue: currentUser.location ?? "")
    }
    
    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                //MARK: - Navigation buttons
                
                VStack {
                    ZStack {
                        HStack {
                            Button {
                                dismiss()
                            } label: {
                                Text("Cancel")
                                    .foregroundColor(.white)
                            }
                            
                            
                            Spacer()
                            
                            Button(action: {
                                Task { await saveData()}
                                dismiss()
                            }, label: {
                                Text("Save")
                                    .foregroundColor(.gray)
                            })
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
                        Button(action: {
                            self.imagePickerPresented.toggle()
                        }, label: {
                            ZStack(alignment: .bottomTrailing) {
//                                Image("profilePhoto")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 120, height: 120)
//                                    .cornerRadius(60)
                                
                                if let image = profileImage {
                                    image
                                        .resizable()
                                        .frame(width: 120, height: 120)
                                        .cornerRadius(60)
                                } else {
                                    Circle()
                                        .frame(width: 120, height: 120)
                                        .cornerRadius(60)
                                        .foregroundColor(Color(red: 152/255, green: 163/255, blue: 16/255))
                                        .overlay(
                                            
                                            Text(viewModel.currentUser!.name.prefix(1).uppercased())
                                                .foregroundColor(.white)
                                                .font(.system(size: 55))
                                        )
                                }
                                
                                
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
                                        .foregroundColor(.black)
                                        .font(.system(size: 16))
                                        .shadow(color: .white, radius: 1, x: 1, y: 1)
                                }
                            }
                        })
                        .sheet(isPresented: $imagePickerPresented) {
                            loadImage()
                        } content: {
                            ImagePicker(image: $selectedImage)

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
                                        Text(viewModel.currentUser!.name).foregroundColor(.white)
                                            .font(.system(size: 16))
                                    }
                                    .foregroundColor(.white)
                                    .padding(.leading, width * 0.05)
                                Spacer()
                                
                            }
                            .frame(width: width * 0.63)
                        }
                        
                        Rectangle()
                            .frame(width: width * 0.9, height: 0.7)
                            .foregroundColor(.gray)
                            .opacity(0.3)
                        
                        HStack {
                            HStack {
                                Text("Username")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16))
                                Spacer()
                            }
                            .frame(width: width * 0.22)
                            
                            HStack {
                                TextField("", text: $userName)
                                    .font(.system(size: 16))
                                    .placeholder(when: userName.isEmpty) {
                                        Text("kuucin").foregroundColor(.white)
                                            .font(.system(size: 16))
                                    }
                                    .foregroundColor(.white)
                                    .padding(.leading, width * 0.05)
                                Spacer()
                                
                            }
                            .frame(width: width * 0.63)
                        }
                        
                        Rectangle()
                            .frame(width: width * 0.9, height: 0.7)
                            .foregroundColor(.gray)
                            .opacity(0.3)
                        
                        HStack(alignment: .top) {
                            HStack {
                                Text("Bio")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16))
                                Spacer()
                            }
                            .padding(.leading, -4)
                            .frame(width: width * 0.2)
                            
                            if #available(iOS 16, *) {
                                TextEditor(text: $bio)
                                    .foregroundColor(.white)
                                    .background(.black)
                                    .scrollContentBackground(.hidden)
                                    .frame(height: 100)
                                    .padding(.leading, width * 0.05)
                                    .overlay(
                                        VStack {
                                            HStack {
                                                
                                                if currentUser.bio == "" {
                                                    Text("Bio")
                                                        .foregroundColor(.gray)
                                                        .font(.system(size: 16))
                                                        .zIndex(1)
                                                        .padding(.top, 8)
                                                        .padding(.leading, 24)
                                                }
                                                Spacer()
                                            }
                                            Spacer()
                                        }
                                    )
                                    .padding(.top, -8)
                                    .frame(width: width * 0.63)
                            }
                        }
                        
                        Rectangle()
                            .frame(width: width * 0.9, height: 0.7)
                            .foregroundColor(.gray)
                            .opacity(0.3)
                        
                        HStack {
                            HStack {
                                Text("Location")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16))
                                Spacer()
                            }
                            .frame(width: width * 0.22)
                            
                            HStack {
                                TextField("", text: $location)
                                    .font(.system(size: 16))
                                    .placeholder(when: location.isEmpty) {
                                        Text("Location").foregroundColor(.gray)
                                            .font(.system(size: 16))
                                    }
                                    .foregroundColor(.white)
                                    .padding(.leading, width * 0.05)
                                Spacer()
                                
                            }
                            .frame(width: width * 0.63)
                        }
                    }
                    .padding(.horizontal, width * 0.05)
                    .padding(.top, 24)
                    
                    Spacer()
                }
                .padding(.top, UIScreen.main.bounds.height * 0.08)
            }
        }
    }
    
    func saveData() async {
        if viewModel.currentUser!.name != self.fullName && !self.fullName.isEmpty {
            viewModel.currentUser!.name = self.fullName
            await viewModel.saveUserData(data: ["name" : self.fullName])
        }
        if viewModel.currentUser!.username != self.userName && !self.userName.isEmpty {
            viewModel.currentUser!.username = self.userName
            await viewModel.saveUserData(data: ["username" : self.userName])
        }
        if viewModel.currentUser!.bio != self.bio && !self.bio.isEmpty {
            viewModel.currentUser!.bio = self.bio
            await viewModel.saveUserData(data: ["bio" : bio])
        }
        if viewModel.currentUser!.location != self.location && !self.location.isEmpty {
            viewModel.currentUser!.location = self.location
            await viewModel.saveUserData(data: ["location" : location])
        }
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
    
}

//struct EditProfile_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfile()
//    }
//}
