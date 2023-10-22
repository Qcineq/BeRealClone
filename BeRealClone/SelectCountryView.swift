//
//  SelectCountryView.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 22/10/2023.
//

import SwiftUI

struct SelectCountryView: View {
    
    var countries: [Country] = Country.allCountries
    
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
                                ForEach(countries, id: \.isoCode) { country in
                                    HStack {
                                        Text("\(country.flag(country: country.isoCode))")
                                    }
                                }
                            }
                        }
                    }
                }
                
            }
        }
    }
}

#Preview {
    SelectCountryView()
}
