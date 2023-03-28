//
//  RecentlyView.swift
//  AppMusic
//
//  Created by David Furtado on 26/01/23.
//

import SwiftUI

struct RecentlyView: View {
    //var cards: Cards = album.first!
    @State var myCards = album
    
    var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    
    var body: some View {
        ScrollView{
            VStack{
                HStack{

                    Text("Recently Played")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                }
                
                //Exibição de container que organiza suas exibições filhas em uma grade que cresce verticalmente criando itens conforme necessário
                LazyVGrid(columns: columns, spacing: 20){
                    
                    ForEach(myCards) { cantoresAlbum in
                        CardsView(cards: cantoresAlbum)
                    }
                }
                .padding(.top,10)
            }
            .padding()
            .padding(.bottom,80)
            
        }
    }
}

struct RecentlyView_Previews: PreviewProvider {
    static var previews: some View {
//        RecentlyView(cards: album.first!)
        RecentlyView()
    }
}
