//
//  TabBar.swift
//  AppMusic
//
//  Created by David Furtado on 26/01/23.
//

import SwiftUI

struct TabBarView: View {
    @State var current = 0
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            TabView(selection: $current){
                HomeView()
                    .tag(0)
                    .tabItem {
                        Image(systemName: "music.note.house.fill")
                        Text("Inicio")
                    }
                SearchView()
                    .tag(1)
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Buscar")
                    }
                LibraryView()
                    .tag(2)
                    .tabItem {
                        Image(systemName: "music.note.list")
                        Text("Biblioteca")
                    }
            }
            MiniPlayerView()
        })
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
