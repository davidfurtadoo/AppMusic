//
//  HomeView.swift
//  AppMusic
//
//  Created by David Furtado on 26/01/23.
//

import SwiftUI

struct HomeView: View {
    @State var myCards = album
    @State var showDone = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    
                    HStack{
                        Text("Top Picks")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        Spacer(minLength: 0)
                    }
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(myCards) { cantoresAlbum in
                                TopPicks(cards: cantoresAlbum)
                            }
                        }
                    }
                    
                    TitleViewRecently()
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(myCards) { cantoresAlbum in
                                CardsView(cards: cantoresAlbum)
                            }
                        }
                    }
                    
                    HStack{
                        Text("Stations for You")
                            .font(.system(size: 25))
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
                }
                .padding()
                TitleView(title: "Listen Now")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showDone = true
                        }, label:{
                            Image("profile")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                        })
                    }
                }
                .sheet(isPresented: $showDone){
                    AccountView(showDone: $showDone)
                }
            }
        }
    }
}

struct CardsView: View{
    let cards: Cards
    
    var body: some View{
        VStack{
            Image(cards.imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 170, height: 170)
                .cornerRadius(15)
            Text(cards.title)
                .font(.subheadline)
                .fontWeight(.bold)
        }
    }
}

struct TopPicks: View{
    let cards: Cards
    
    var body: some View{
        VStack{
            Text(cards.title)
                .font(.subheadline)
                .fontWeight(.bold)
            Image(cards.imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 270, height: 370)
                .cornerRadius(15)
        }
    }
}

struct TitleViewRecently: View{
    @State var myAlbum = album
    
    var body: some View{
        NavigationLink(destination: RecentlyView()){
            HStack{
                Text("Recently Played")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
