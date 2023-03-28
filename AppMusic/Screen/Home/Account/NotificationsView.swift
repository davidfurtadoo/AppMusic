//
//  NotificationsView.swift
//  AppMusic
//
//  Created by David Furtado on 23/02/23.
//

import SwiftUI

struct NotificationsView: View {
    @State var newMusic = false
    @State var friend = false
    
    let rodapeFriend = "Apple associates your notifications viewing and interaction data with your Apple ID."
    
    var body: some View {
        VStack{
            HStack{
                Text("Notifications")
                    .font(.system(size: 25))
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.primary)
            }
            Form{
                Section{
                    VStack(alignment: .leading, spacing: 5){
                        Toggle("New Music", isOn: $newMusic)
                        Text("Artist you like release new music and videos")
                            .font(.system(size: 17))
                    }
                }
                
                Section(footer: Text(rodapeFriend)){
                    VStack(alignment: .leading, spacing: 5){
                        Toggle("Friend Activity", isOn: $friend)
                        Text("Friends follow you and your playlists")
                            .font(.system(size: 17))
                    }
                }
            }
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
