//
//  TimeZoneView.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 06/09/2023.
//

import SwiftUI

struct TimeZoneView: View {
    var body: some View {
        ZStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    ZStack {
                        Text("Timezone")
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct TimeZoneView_Previews: PreviewProvider {
    static var previews: some View {
        TimeZoneView()
    }
}
