//
//  TesteListViewModel.swift
//  AppMusic
//
//  Created by David Furtado on 09/03/23.
//

import Combine
import Foundation
import SwiftUI

class SongTesteListViewModel: ObservableObject{
    @Published var loadTerm: String = ""
    @Published public private(set) var songs: [SongTesteViewModel] = []
    
    private let dataModel: DataModel = DataModel()
    private let artworkLoader: ArtworkLoader = ArtworkLoader()
    private var disposables = Set<AnyCancellable>()
    
    init(){
        $loadTerm
            .sink(receiveValue: loadSongs(loadTerm: ))
            .store(in: &disposables)
    }
    
    private func loadSongs(loadTerm: String){
        //esvaziar a lista para remover todas as musicas
        songs.removeAll()
        artworkLoader.reset()
        //carregue as musicas
        dataModel.loadSongs(searchTerm: loadTerm){songs in
            songs.forEach{ self.appendSong(song: $0)}
        }
    }
    
    private func appendSong(song: Song){
        let songViewModel = SongTesteViewModel(song: song)
        DispatchQueue.main.async {
            self.songs.append(songViewModel)
        }
        
        artworkLoader.loadArtwork(forSong: song){ image in
            DispatchQueue.main.async {
                songViewModel.artwork = image
            }
        }
    }
}

class SongTesteViewModel: Identifiable, ObservableObject{
    let id: Int
    let trackName: String
    let artistName: String
    @Published var artwork: Image?
    
    init(song: Song){
        self.id = song.id
        self.trackName = song.trackName
        self.artistName = song.artistName
    }
}
