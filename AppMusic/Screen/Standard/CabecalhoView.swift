//
//  CabecalhoView.swift
//  AppMusic
//
//  Created by David Furtado on 07/03/23.
//

import SwiftUI

struct CabecalhoView: View {
    var body: some View {
        NavigationView {
            TitleView(title: "teste")
        }
        
    }
}

struct TitleView: View {
    var title = ""
    
    var body: some View {
        VStack{}
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading) {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.primary)
            }
        }
    }
}

struct CabecalhoView_Previews: PreviewProvider {
    static var previews: some View {
        CabecalhoView()
    }
}
