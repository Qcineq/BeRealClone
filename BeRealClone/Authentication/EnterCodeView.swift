//
//  EnterCodeView.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 05/11/2023.
//

import SwiftUI
import Combine

struct EnterCodeView: View {
    
    @State var otpCode: String = ""
    @State var buttonActive = false
    
    @State var timeRemaining = 60
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
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
                
                VStack {
                    
                    VStack {
                        
                        VStack(alignment: .center, spacing: 8) {
                            Text("Enter the code we sent to +48 123 456 789")
                                .foregroundStyle(.white)
                                .fontWeight(.medium)
                                .font(.system(size: 16))
                            
                            Text("......")
                                .foregroundStyle(viewModel.otpText.isEmpty ? .gray : .black)
                                .opacity(0.8)
                                .font(.system(size: 70))
                                .padding(.top, -40)
                                .overlay(
                                    TextField("", text: $viewModel.otpText)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 24, weight: .heavy))
                                        .keyboardType(.numberPad)
                                        .onReceive(Just(viewModel.otpText), perform: { _ in
                                            limitText(6)
                                        })
                                        .onReceive(Just(viewModel.otpText), perform: { newValue in
                                            let filtered = newValue.filter({Set("0123456789").contains($0)})
                                            
                                            if filtered != newValue {
                                                viewModel.otpText = filtered
                                            }
                                        })
                                )
                        }
                        .padding(.top, 50)
                        Spacer()
                    }
                    
                    
                    VStack {
                        Text("Change the phone number")
                            .foregroundStyle(.gray)
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                        
                        Button {
                            if buttonActive {
                                Task { await self.viewModel.verifyOTP()}
                            }
                        } label: {
                            WhiteButtonView(buttonActive: $buttonActive, text: viewModel.otpText.count == 6 ? "Continue" : "Resend in \(timeRemaining)s")
                        }
                        .disabled(buttonActive ? false : true)
                        .onChange(of: viewModel.otpText) { newValue in
                            if !newValue.isEmpty {
                                buttonActive = true
                            } else if newValue.isEmpty {
                                buttonActive = false
                            }
                        }
                    }
                    
                }
            }
            .onReceive(timer, perform: { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
                    buttonActive = true
                }
            })
        }
    }
    
    func limitText(_ upper: Int) {
            if viewModel.otpText.count > upper {
                viewModel.otpText = String(viewModel.otpText.prefix(upper))
            }
        }
}

#Preview {
    EnterCodeView()
}
