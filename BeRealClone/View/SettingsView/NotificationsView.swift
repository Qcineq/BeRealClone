//
//  NotificationsView.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 13/09/2023.
//

import SwiftUI

struct NotificationsView: View {
    
    @State var mentions = false
    @State var comments = false
    @State var friendsRequests = false
    @State var lateBeReal = false
    @State var realMojis = false
    
    @State var buttonActive = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    ZStack {
                        Text("Notifications")
                            .fontWeight(.semibold)
                        
                        HStack {
                            
                            Button(action: {
                                dismiss()
                            }, label: {
                                Image(systemName: "arrow.backward")
                            })
                            
                            Spacer()
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .foregroundColor(.white)
                
                VStack {
                    VStack {
                        HStack {
                            Text("On BeReal, you,re in control of your push notifications.")
                            
                            Spacer()
                        }
                        
                        HStack {
                            Text("You can choose the type of notifications you want to receive.")
                            
                            Spacer()
                        }
                        
                    }
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    
                    
                    VStack(spacing: 14) {
                        
                        // Mentions
                        
                        VStack {
                            NotificationsButtonView(icon: "person.crop.square.filled.and.at.rectangle", text: "Mentions", toggle: $mentions)
                            
                            HStack {
                                Text("somebody mentioned you on somebody's BeReal")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)
                                
                                Spacer()
                            }
                        }
                        
                        // Comments
                        
                        VStack {
                            NotificationsButtonView(icon: "bubble.left.fill", text: "Comments", toggle: $comments)
                            
                            HStack {
                                Text("somebody commented on your BeReal")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)
                                
                                Spacer()
                            }
                        }
                        
                        // Friend Request
                        
                        VStack {
                            NotificationsButtonView(icon: "person.2.fill", text: "Friend request", toggle: $friendsRequests)
                            
                            HStack {
                                Text("somebody just sent you a friend request BeReal")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)
                                
                                Spacer()
                            }
                        }
                        
                        // Late BeReal.
                        
                        VStack {
                            NotificationsButtonView(icon: "timer", text: "Late BeReal.", toggle: $lateBeReal)
                            
                            HStack {
                                Text("somebody just posted late")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)
                                
                                Spacer()
                            }
                        }
                        
                        // RealMojis
                        
                        VStack {
                            NotificationsButtonView(icon: "face.smiling.fill", text: "RealMojis", toggle: $realMojis)
                            
                            HStack {
                                Text("somebody just reacted to your BeReal")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)
                                
                                Spacer()
                            }
                        }
                    }
                    .padding(.top, 8)
                    
                    Spacer()
                    
                }
                .padding(.horizontal)
                .padding(.top, 50)
                
                VStack {
                    
                    Spacer()
                    
                    WhiteButtonView(buttonActive: $buttonActive, text: "Save")
                        .onChange(of: mentions || comments || friendsRequests || lateBeReal || realMojis){ _ in
                            
                            self.buttonActive = true
                        }
                }
            }
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
