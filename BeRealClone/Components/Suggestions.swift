//
//  Suggestions.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 10/09/2023.
//

import SwiftUI

struct Suggestions: View {
    var body: some View {
        VStack {
            
            ScrollView {
                VStack {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(height: 65)
                        .foregroundColor(Color(red: 40/255, green: 40/255, blue: 35/255))
                        .overlay(
                            HStack {
                                Image("profilePhoto")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(20)
                                
                                VStack(alignment: .leading) {
                                    Text("Invite friends on BeReal")
                                        .foregroundColor(.white)
                                        .fontWeight(.semibold)
                                    
                                    Text("bere.al/kuucin")
                                        .foregroundColor(.gray)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "square.and.arrow.up")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                            }
                                .padding(.horizontal)
                        )
                        .padding(.horizontal)
                    
                    VStack {
                        HStack {
                            Text("ADD YOUR CONTACTS")
                                .foregroundColor(Color(red: 205/255, green: 204/255, blue: 209/255))
                                .fontWeight(.semibold)
                                .font(.system(size: 14))
                            Spacer()
                        }
                        
                        ForEach(1..<16) { _ in
                            
                            SuggestionCellView()
                        }
                        
                        
                    }
                    .padding(.top)
                    Spacer()
                }
                .padding(.top, 20)
            }
            .padding(.top, 110) 
        }
    }
}

struct Suggestions_Previews: PreviewProvider {
    static var previews: some View {
        Suggestions()
    }
}
