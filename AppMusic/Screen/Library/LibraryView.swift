//
//  LibraryView.swift
//  AppMusic
//
//  Created by David Furtado on 26/01/23.
//

import SwiftUI
import MobileCoreServices

struct LibraryView: View {
    var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    var body: some View {
        DemoList()
        
    }
}

struct DemoList: View {
    @State private var cards: [CardsPlaylist] = playlist
    @State private var editMode = EditMode.inactive
    private static var count = 0

    var body: some View {
        NavigationView {
            List {
                //HeaderView()
                ForEach(cards) { cantoresAlbum in
                    CardView(playlist: cantoresAlbum)
                }
                .onDelete(perform: onDelete)
                .onMove(perform: onMove)
                .onInsert(of: [String(kUTTypeURL)], perform: onInsert)
            }
            .listStyle(.plain)
            .navigationBarTitle("Library")
            .navigationBarItems(leading: EditButton(), trailing: addButton)
            .environment(\.editMode, $editMode)
        }
    }

    private var addButton: some View {
        switch editMode {
        case .inactive:
            return AnyView(Button(action: onAdd) { Image(systemName: "plus") })
        default:
            return AnyView(EmptyView())
        }
    }

    private func onDelete(offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
    }

    private func onMove(source: IndexSet, destination: Int) {
        cards.move(fromOffsets: source, toOffset: destination)
    }

    private func onInsert(at offset: Int, itemProvider: [NSItemProvider]) {
        for provider in itemProvider {
            if provider.canLoadObject(ofClass: URL.self) {
                _ = provider.loadObject(ofClass: URL.self) { url, error in
                    DispatchQueue.main.async {
                        url.map { self.cards.insert(CardsPlaylist(title: $0.absoluteString, subTitulo: $0.absoluteString, imageUrl: $0.absoluteString), at: offset) }
                    }
                }
            }
        }
    }

    private func onAdd() {
        cards.append(CardsPlaylist(title: "Nova Musica #\(DemoList.count)", subTitulo: "Musica", imageUrl: "music"))
        DemoList.count += 1
    }
}

@ViewBuilder
func HeaderView()->some View{
    ScrollView(.horizontal, showsIndicators: false){
        HStack(spacing: 5){
            let tags = ["Playlist","Podcast & Shows", "Album", "Artist"]
            ForEach(tags, id: \.self){tag in
                Button{
                    
                }label: {
                    Text(tag)
                        .font(.callout)
                        .foregroundColor(.black)
                        .padding(.vertical,6)
                        .padding(.horizontal,12)
                        .background(
                            Capsule()
                                .fill(.black.opacity(0.08))
                        )
                }
            }
        }
    }
}

struct CardView: View{
    let playlist: CardsPlaylist
    
    var body: some View{
        HStack{
            Image(playlist.imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 90, height: 90)
                .cornerRadius(15)
                .padding(.horizontal,6)
            VStack(alignment: .leading, spacing: 3){
                Text(playlist.title)
                    .font(.subheadline)
                    .fontWeight(.bold)
                Text(playlist.subTitulo)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
            }
            Spacer()
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
