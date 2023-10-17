//
//  EnterAgeView.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 17/10/2023.
//

import SwiftUI
import Combine

struct EnterAgeView: View {
    
    @State var day = ""
    @State var month = ""
    @State var year = ""
    
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
                
                VStack(alignment: .center, spacing: 8) {
                    Text("Hi, when's your birthday?")
                        .foregroundStyle(.white)
                        .fontWeight(.heavy)
                        .font(.system(size: 16))
                    
                    HStack(spacing: 4) {
                        Text("MM")
                            .foregroundStyle(month.isEmpty ? Color(red: 70/255, green: 70/255, blue: 73/255) : Color.black)
                            .fontWeight(.heavy)
                            .font(.system(size: 40))
                            .frame(width: 72)
                            .overlay(
                                
                                TextField("", text: $month)
                                    .foregroundColor(.white)
                                    .font(.system(size: 45, weight: .heavy))
                                    .multilineTextAlignment(.center)
                                    .keyboardType(.numberPad)
                                    .onReceive(Just(month), perform: { newValue in
                                        let filtered = newValue.filter {
                                            Set("0123456789").contains($0) }
                                        if filtered != newValue {
                                            self.month = filtered
                                        }
                                    })
                                    .onReceive(Just(month), perform: { _ in
                                        if month.count > 2 {
                                            month = String(month.prefix(2))
                                        }
                                    })
                                
                            )
                        
                        Text("DD")
                            .foregroundStyle(day.isEmpty ? Color(red: 70/255, green: 70/255, blue: 73/255) : Color.black)
                            .fontWeight(.heavy)
                            .font(.system(size: 40))
                            .frame(width: 58)
                            .overlay(
                                
                                TextField("", text: $day)
                                    .foregroundColor(.white)
                                    .font(.system(size: 45, weight: .heavy))
                                    .multilineTextAlignment(.center)
                                    .keyboardType(.numberPad)
                                    .onReceive(Just(day), perform: { newValue in
                                        let filtered = newValue.filter {
                                            Set("0123456789").contains($0) }
                                        if filtered != newValue {
                                            self.day = filtered
                                        }
                                    })
                                    .onReceive(Just(day), perform: { _ in
                                        if day.count > 2 {
                                            day = String(day.prefix(2))
                                        }
                                    })
                                
                            )
                        
                        Text("YYYY")
                            .foregroundStyle(year.isEmpty ? Color(red: 70/255, green: 70/255, blue: 73/255) : Color.black)
                            .fontWeight(.heavy)
                            .font(.system(size: 40))
                            .frame(width: 120)
                            .overlay(
                                
                                TextField("", text: $year)
                                    .foregroundColor(.white)
                                    .font(.system(size: 45, weight: .heavy))
                                    .multilineTextAlignment(.center)
                                    .keyboardType(.numberPad)
                                    .onReceive(Just(year), perform: { newValue in
                                        let filtered = newValue.filter {
                                            Set("0123456789").contains($0) }
                                        if filtered != newValue {
                                            self.year = filtered
                                        }
                                    })
                                    .onReceive(Just(year), perform: { _ in
                                        if year.count > 4 {
                                            year = String(year.prefix(4))
                                        }
                                    })
                                
                            )
                    }
                }
            }
        }
    }
}

#Preview {
    EnterAgeView()
}
