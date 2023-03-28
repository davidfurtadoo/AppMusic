//
//  HomeViewModel.swift
//  AppMusic
//
//  Created by David Furtado on 26/01/23.
//

import Foundation

struct Cards: Identifiable,Codable, Hashable{
    var id = UUID()
    let title, imageUrl: String
}

let album = [
    Cards(title: "Mc Cabelinho", imageUrl: "p1"),
    Cards(title: "Filipe Ret", imageUrl: "p2"),
    Cards(title: "L7nnon", imageUrl: "p3"),
    Cards(title: "Leo Santana", imageUrl: "p4"),
    Cards(title: "Marilia Mendonça", imageUrl: "p5"),
    Cards(title: "Matue", imageUrl: "p6"),
    Cards(title: "Grupo Menos e Mais", imageUrl: "p7"),
    Cards(title: "Orochi", imageUrl: "p8")
]


