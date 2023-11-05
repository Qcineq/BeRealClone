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
                                .foregroundStyle(otpCode.isEmpty ? .gray : .black)
                                .opacity(0.8)
                                .font(.system(size: 70))
                                .padding(.top, -40)
                                .overlay(
                                    TextField("", text: $otpCode)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 24, weight: .heavy))
                                        .keyboardType(.numberPad)
                                        .onReceive(Just(otpCode), perform: { _ in
                                            limitText(6)
                                        })
                                        .onReceive(Just(otpCode), perform: { newValue in
                                            let filtered = newValue.filter({Set("0123456789").contains($0)})
                                            
                                            if filtered != newValue {
                                                otpCode = filtered
                                            }
                                        })
                                )
                        }
                        .padding(.top, 50)
                        Spacer()
                    }
                    
                }
            }
        }
    }
    
    func limitText(_ upper: Int) {
            if otpCode.count > upper {
                otpCode = String(otpCode.prefix(upper))
            }
        }
}

#Preview {
    EnterCodeView()
}
