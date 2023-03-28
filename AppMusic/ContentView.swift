//
//  ContentView.swift
//  AppMusic
//
//  Created by David Furtado on 26/01/23.
//

import SwiftUI

struct ContentView: View {
    @State var current = 0
    
    //MiniPlayer Properties
    @State var expand = false
    @Namespace var animation
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            TabView(selection: $current){
                HomeView()
                    .tag(0)
                    .tabItem {
                        Image(systemName: "music.note.house.fill")
                        Text("Listen Now")
                    }
                /*SearchView()
                    .tag(1)
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }*/
                LibraryView()
                    .tag(2)
                    .tabItem {
                        Image(systemName: "music.note.list")
                        Text("Library")
                    }
                StartSearchView(viewModel: SongListViewModel())
                    .tag(4)
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
            }
            MiniPlayerView(animation: animation, expand: $expand)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
