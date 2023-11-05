//
//  SelectCountryView.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 22/10/2023.
//

import SwiftUI

struct SelectCountryView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    ZStack {
                        Text("Select Country")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                        
                        HStack {
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "xmark")
                                    .font(.system(size: 16))
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                            }
                            
                            Spacer()
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal)
                
                VStack {
                    VStack {
                        List {
                            Section {
                                HStack {
                                    Image(systemName: "flag.fill")
                                    Text("Country (+48)")
                                }
                                .onTapGesture {
                                    dismiss()
                                }
                            }
                        }
                    }
                }
                .padding(.top, 50)
            }
            .environment(\.colorScheme, .dark)
        }
    }
}

struct SelectCountryView_Previews: PreviewProvider {
    static var previews: some View {
        SelectCountryView()
    }
}
