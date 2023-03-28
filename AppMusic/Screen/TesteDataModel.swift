//
//  TesteDataModel.swift
//  AppMusic
//
//  Created by David Furtado on 09/03/23.
//

import Foundation

//Enviará uma solicitação para obter a resposta da API
class TesteDataModel{
    
    private var dataTask: URLSessionDataTask?
    
    //metodo que realmente constroi ou cria url
    func loadSongs(loadTerm: String, completion: @escaping(([TesteSong]) -> Void)){
        //cancelar qualquer tarefa que esteja sendo executada
        dataTask?.cancel()
        guard let url = buildUrl(forTerm: loadTerm) else{
            completion([])
            return
        }
        
        dataTask = URLSession.shared.dataTask(with: url){ data, _, _ in
            guard let data = data else {
                completion([])
                return
            }
            
            if let songResponse = try? JSONDecoder().decode(TesteSongResponse.self, from: data){
                completion(songResponse.songs)
            }
        }
        dataTask?.resume()
    }
    
    private func buildUrl(forTerm loadTerm: String) -> URL?{
        guard !loadTerm.isEmpty else { return nil }
        
        let queryItems = [
            URLQueryItem(name: "term", value: loadTerm),
            URLQueryItem(name: "entity", value: "song")
        ]
        var components = URLComponents(string: "https://itunes.apple.com/search")
        components?.queryItems = queryItems
        
        return components?.url
    }
}

struct TesteSongResponse: Decodable{
    let songs: [TesteSong]
    
    enum CodingKeys: String, CodingKey{
        case songs = "results"
    }
}

struct TesteSong: Decodable{
    let id: Int
    let trackName: String
    let artistName: String
    let artworkUrl: String
    
    enum CodingKeys: String, CodingKey{
        case id = "trackId"
        case trackName
        case artistName
        case artworkUrl = "artworkUrl60"
    }
}
