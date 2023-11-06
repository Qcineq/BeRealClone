//
//  EnterNameView.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 10/10/2023.
//

import SwiftUI

struct EnterNameView: View {
    
    @State var name = ""
    @State var buttonActive = false
    
    @Binding var nameButtonClicked: Bool
    
    @EnvironmentObject var viewModel: AuthViewModel
    
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
                    VStack(alignment: .center, spacing: 8) {
                        Text("Let's get started, what's your name?")
                            .fontWeight(.heavy)
                            .font(.system(size: 16))
                        
                        Text("Your name")
                            .foregroundStyle(name.isEmpty ? Color(red: 70/255, green: 70/255, blue: 73/255) : Color.black)
                            .fontWeight(.heavy)
                            .font(.system(size: 40))
                            .frame(width: 210)
                            .overlay(
                                TextField("", text: $name)
                                    .font(.system(size: 40))
                                    .fontWeight(.heavy)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            )
                    }
                    .foregroundColor(.white)
                    
                    Spacer()
                }
                .padding(.top, 50)
                
                VStack {
                    Spacer()
                    
                    Button{
                        if buttonActive {
                            self.nameButtonClicked = true
                        } else {
                            self.nameButtonClicked = false
                        }
                    } label: {
                        WhiteButtonView(buttonActive: $buttonActive, text: "Continue")
                            .onChange(of: name) { newValue in
                                if !newValue.isEmpty {
                                    buttonActive = true
                                } else {
                                    buttonActive = false
                                }
                            }
                    }
                }
            }
        }
    }
}

//#Preview {
//    EnterNameView()
//}
