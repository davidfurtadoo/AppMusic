//
//  ProfileView.swift
//  AppMusic
//
//  Created by David Furtado on 23/02/23.
//

import SwiftUI

struct ProfileView: View {
    @State var myCards = album
    @State var showEditProfile = false
    
    var body: some View {
        ScrollView{
            VStack{
                Image("profile")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 250, height: 250, alignment: .center)
                Text("David Furtado")
                    .font(.system(size: 50))
                    .foregroundColor(.gray)
                Text("@davidfurtado00")
                    .font(.system(size: 25))
                    .foregroundColor(.gray)
                
                Button(action: {
                    showEditProfile = true
                }, label:{
                    Text("Edit")
                        .font(.system(size: 25))
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 25)
                        .padding(.vertical,10)
                        .background{
                            Capsule()
                                .fill(Color(.gray).gradient)
                        }
                })
                
                HStack{
                    Text("Playlists")
                        .font(.system(size: 25))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    Spacer(minLength: 0)
                }
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(myCards) { cantoresAlbum in
                            CardsView(cards: cantoresAlbum)
                        }
                    }
                }
                
                HStack{
                    NavigationLink(destination: Text("Listening To")){
                        Text("Listening To")
                            .font(.system(size: 25))
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        Spacer(minLength: 0)
                    }
                }
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(myCards) { cantoresAlbum in
                            CardsView(cards: cantoresAlbum)
                        }
                    }
                }
                
                Friends()
                HStack{
                    Button(action: {
                        showEditProfile = true
                    }, label:{
                        Text("Floow More Friends")
                            .frame(width: 300 ,height: 60)
                            .font(.system(size: 25))
                            .background(.gray)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    })
//                    NavigationLink(destination: AccountSettingsView(showEditProfile: $showEditProfile)){
//                        Text("Floow More Friends")
//                            .frame(width: 300 ,height: 60)
//                            .font(.system(size: 25))
//                            .background(.gray)
//                            .foregroundColor(.white)
//                            .cornerRadius(15)
////                    }
                }
            }
            .padding()
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button("Share Profile...", action: { })
                        Button("Edit Profile", action: {
                            showEditProfile = true
                        })
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .font(.system(size: 30))
                            .foregroundColor(.gray)
                    }
                }
            }
            .sheet(isPresented: $showEditProfile){
                EditProfileView(showEditProfile: $showEditProfile)
            }
        }
    }
}

struct Friends: View{
    var body: some View{
        HStack{
            Text("Followers")
                .font(.system(size: 25))
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            Spacer(minLength: 0)
        }
        HStack{
            Follow()
        }
        
        HStack{
            Text("Following")
                .font(.system(size: 25))
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            Spacer(minLength: 0)
        }
        HStack{
            Follow()
        }
    }
}

struct Follow: View{
    var body: some View{
        VStack{
            Image("profile")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 200, height: 200)
            Text("Vinicius Araujo")
                .font(.system(size: 20))
        }
    }
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
