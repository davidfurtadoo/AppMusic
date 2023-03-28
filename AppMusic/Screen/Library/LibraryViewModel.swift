//
//  LibraryViewModel.swift
//  AppMusic
//
//  Created by David Furtado on 26/01/23.
//

import Foundation

struct CardsPlaylist: Identifiable{
    let id = UUID()
    let title, subTitulo, imageUrl: String
}

var playlist = [
    CardsPlaylist(title: "Mc Cabelinho Essentials",subTitulo: "Hip Hop/Rap", imageUrl: "p1"),
    CardsPlaylist(title: "Filipe Ret Essentials",subTitulo: "Hip Hop/Rap", imageUrl: "p2"),
    CardsPlaylist(title: "L7nnon Essentials",subTitulo: "Hip Hop/Rap", imageUrl: "p3"),
    CardsPlaylist(title: "Leo Santana Essentials",subTitulo: "Axé", imageUrl: "p4"),
    CardsPlaylist(title: "Matue",subTitulo: "Hip Hop/Rap", imageUrl: "p6"),
    CardsPlaylist(title: "Orochi",subTitulo: "Hip Hop/Rap", imageUrl: "p8")
]


