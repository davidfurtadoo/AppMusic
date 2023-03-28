//
//  EditProfileView.swift
//  AppMusic
//
//  Created by David Furtado on 15/03/23.
//

import SwiftUI

struct EditProfileView: View {
    @State var name = "David Furtado"
    @State var userName = "@davidfurtado00"
    @State var isEveryone = true
    @State var isApprove = false
    @State var isListening = true
    @Binding var showEditProfile:Bool
    
    let rodapeName = "Your photo, name, and username will be visible in Apple Music and web search results."
    let rodape = "The albums and playlists to whitch you listen appear on your profile and people who follow you will see your profile image on the music you've been playing"
    
    
    @State private var cards: [CardsPlaylist] = playlist
    var body: some View {
        NavigationView {
            VStack{
                Form{
                    Section(footer: Text(rodapeName)){
                        Image("profile")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .padding(EdgeInsets(top: 10, leading: 40, bottom: 10, trailing: 40))
                        HStack{
                            Text("Name:")
                            Spacer()
                            TextField("Name", text: $name)
                        }
                        HStack{
                            Text("UserName:")
                            Spacer()
                            TextField("UserName", text: $userName)
                        }
                    }
                    Section(header: Text("WHO CAN FOLLOW YOUR ACTIVITY")){
                        Toggle("Everyone", isOn: $isEveryone)
                        Toggle("People you approve", isOn: $isApprove)
                        
                    }
                    Section(header:Text("SHARED PLAYLISTS"), footer: Text("These playlists appear on your profile and in search results.")){
                        ForEach(cards) { cantoresAlbum in
                            CardView(playlist: cantoresAlbum)
                        }
                    }
                    Section(header: Text("SHOW ON PROFILE"),footer: Text(rodape)){
                        Toggle("Listening To", isOn: $isListening)
                    }
                    Section{
                        NavigationLink(destination: Text("Delete Profile")){
                            Text("Delete Profile")
                                .font(.system(size: 20))
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Text("Edit Profile")
                        .font(.body)
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showEditProfile = false
                    }, label: {
                        
                        Text("Done")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                    })
                }
            }
        }
    }
}


struct EditProfileView_Previews: PreviewProvider {
    @State static var showEditProfile = true
    static var previews: some View {
        EditProfileView(showEditProfile: $showEditProfile)
    }
}
