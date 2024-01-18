//
//  CameraView.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 10/01/2024.
//

import SwiftUI

struct CameraView: View {
    
    @State var switchingCamera = false
    
    @State var takePhotoClick = false
    
    @State var selectedBackImage: UIImage?
    
    @State var backImage: Image?
    
    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    HStack {
                        Spacer()
                        Text("BeReal.")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 22))
                        Spacer()
                    }
                    Spacer()
                }
                
                VStack {
                    Text("04:57:11")
                        .foregroundStyle(.white)
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                    
                    if let image = backImage {
                        image
                            .resizable()
                            .cornerRadius(12)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.6)
                            .scaledToFit()
                            .overlay(
                                
                                VStack {
                                    ProgressView()
                                    Text("Wait, wait, wait, now smile")
                                }
                                    .foregroundStyle(.white)
                                    .opacity(self.switchingCamera ? 1 : 0)
                            )
                        
                    } else {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(.gray)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.6)
                            .overlay(
                                
                                VStack {
                                    ProgressView()
                                    Text("Wait, wait, wait, now smile")
                                }
                                    .foregroundStyle(.white)
                                    .opacity(self.switchingCamera ? 1 : 0)
                            )
                            .sheet(isPresented: $takePhotoClick) {
                                loadBackImage()
                                
                            } content: {
                                ImagePicker(image: $selectedBackImage)
                            }
                    }
                    
                    VStack {
                        HStack(alignment: .center, spacing: 18) {
                            Image(systemName: "bolt.slash.fill")
                                .font(.system(size: 28))
                            
                            Button {
                                self.takePhotoClick.toggle()
                            } label: {
                                Image(systemName: "circle")
                                    .font(.system(size: 70))
                            }
                            
                            Image(systemName: "arrow.triangle.2.circlepath")
                                .font(.system(size: 24))
                        }
                        .foregroundColor(.white)
                    }
                    
                    Spacer()
                }
                .padding(.top, 50)
            }
        }
    }
    
    func loadBackImage() {
        guard let selectedBackImage = selectedBackImage else { return }
        backImage = Image(uiImage: selectedBackImage)
    }
}

#Preview {
    CameraView()
}
