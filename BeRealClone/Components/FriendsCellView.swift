//
//  FriendsCellView.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 10/09/2023.
//

import SwiftUI

struct FriendsCellView: View {
    var body: some View {
        
        HStack{
            Image("profilePhoto")
                .resizable()
                .scaledToFit()
                .frame(width: 65, height: 65)
                .cornerRadius(65/2)
            
            VStack(alignment: .leading) {
                Text("Tomek")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                Text("tooom")
                    .foregroundColor(.gray)
            }
            Spacer()

            Image(systemName: "xmark")
                .foregroundColor(.gray)
                .font(.system(size: 16))
                .padding(.leading, 6)

        }
        .padding(.horizontal)

    }
}

struct FriendsCellView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsCellView()
    }
}
