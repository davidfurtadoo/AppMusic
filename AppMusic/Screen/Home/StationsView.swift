//
//  StationsView.swift
//  AppMusic
//
//  Created by David Furtado on 30/01/23.
//

import SwiftUI

struct StationsView: View {
    
    
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    
                    Text("Stations for You")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                }
                PlaylistCardView()
                
            }
            .padding()
            .padding(.bottom,80)
        }
    }
}

struct StationsView_Previews: PreviewProvider {
    static var previews: some View {
        StationsView()
    }
}
