//
//   EnterPhoneNumberView.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 05/11/2023.
//

import SwiftUI

struct EnterPhoneNumberView: View {
    
    @State var showCountryList = false
    @State var phoneNumber = ""
    @State var buttonActive = false
    
    @Binding var phoneNumberButtonClicked: Bool
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Text("BeReal")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 22))
                        
                        Spacer()
                    }
                    
                    Spacer()
                    
                }
                
                VStack(alignment: .center, spacing: 8) {
                    
                    Text ("Create your account using your phone number")
                        .foregroundStyle(.white)
                        .fontWeight(.heavy)
                        .font(.system(size: 16))
                    
                    HStack {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .stroke(lineWidth: 1)
                            .frame(width: 75, height: 45)
                            .foregroundStyle(.gray)
                            .overlay(
                                
                                Text("\(Image(systemName: "flag.fill")) +48")
                                    .foregroundColor(.white)
                                    .font(.system(size: 12))
                                    .fontWeight(.bold)
                            )
                            .onTapGesture {
                                self.showCountryList.toggle()
                            }
                        
                        Text("Your Phone")
                            .foregroundStyle(phoneNumber.isEmpty ? Color(red: 70/255, green: 70/255, blue: 73/255) : .black)
                            .fontWeight(.heavy)
                            .font(.system(size: 40))
                            .frame(width: 220)
                            .overlay(
                                
                                TextField("", text: $phoneNumber)
                                    .foregroundStyle(.white)
                                    .font(.system(size: 40, weight: .heavy))
                            )
                    }
                    .padding(.leading, UIScreen.main.bounds.width * 0.05)
                    
                    Spacer()
                    
                }
                .padding(.top, 50)
                
                VStack {
                    
                    Spacer()
                    
                    Text("By tapping \"Continue\", you agree to our Privacy Policy and Terms of Service.")
                        .foregroundStyle(Color(red: 70/255, green: 70/255, blue: 73/255))
                        .fontWeight(.semibold)
                        .font(.system(size: 14))
                        .multilineTextAlignment(.center)
                    
                    Button {
                        
                    } label: {
                        WhiteButtonView(buttonActive: $buttonActive, text: "Continue")
                            .onChange(of: phoneNumber) { newValue in
                                if !newValue.isEmpty {
                                    buttonActive = true
                                } else if newValue.isEmpty {
                                    buttonActive = false
                                }
                            }
                    }
                    .disabled(phoneNumber.isEmpty ? true : false)
                    
                }
            }
        }
        .sheet(isPresented: $showCountryList) {
            SelectCountryView()
        }
        .environment(\.colorScheme, .dark)
        
    }
}

//#Preview {
//    EnterPhoneNumberView()
//}
