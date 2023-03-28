//
//  AlbumView.swift
//  AppMusic
//
//  Created by David Furtado on 22/02/23.
//

import SwiftUI

struct PlaylistCardView: View {
    var cards: Cards = album.first!
    
    var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    
    var body: some View {
        //Exibição de container que organiza suas exibições filhas em uma grade que cresce verticalmente criando itens conforme necessário
        LazyVGrid(columns: columns, spacing: 20){
            
            ForEach(1...8, id: \.self){ index in
                Image("p\(index)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: (UIScreen.main.bounds.width - 50) / 2, height: 180)
                    .cornerRadius(15)
            }
        }
        .padding(.top,10)
    }
}

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistCardView()
    }
}
