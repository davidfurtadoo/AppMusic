//
//  AccountView.swift
//  AppMusic
//
//  Created by David Furtado on 23/02/23.
//

import SwiftUI

struct AccountView: View {
    @State var findFriends = true
    @State var appleID = false
    @State var alexa = true
    @State var webPlayer = true
    @Binding var showDone:Bool
    
    let rodapeFindFriends = "Allow Apple Music to periodically check the contacts on your devices to recommend new friends."
    let rodapeAppleID = "People who have your Apple ID contact information may see you as a recommended friend."
    
    var body: some View {
        NavigationView{
            VStack{
                TitleView(title: "Account")
                Form{
                    Section{
                        NavigationLink(destination: ProfileView()){
                            Image("profile")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                            VStack(alignment: .leading, spacing: 3){
                                Text("David Furtado")
                                    .font(.system(size: 20))
                                Text("View Profile")
                                    .font(.system(size: 15))
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    Section{
                        Button(action: {}, label: {
                            Text("Redeem Gift Card or Code")
                                .font(.system(size: 20))
                                .foregroundColor(.red)
                        })
                    }
                    Section{
                        NavigationLink(destination: NotificationsView()){
                                Text("Notifications")
                                    .font(.system(size: 20))
                        }
                    }
                    Section(header: Text("FIND FRIENDS"), footer: Text(rodapeFindFriends)){
                        Toggle("Contacts on Apple Music", isOn: $findFriends)
                    }
                    Section(footer: Text(rodapeAppleID)){
                        Toggle("Allow Finding by Apple ID",isOn: $appleID)
                    }
                    Section(header: Text("APPS WITH ACCESS")){
                        Toggle("Apple Music on Alexa", isOn: $alexa)
                        Toggle("Apple Music and TV Web Player", isOn: $webPlayer)
                    }
                    Section{
                        NavigationLink(destination: Text("Account Settings")){
                            Text("Account Settings")
                                .font(.system(size: 20))
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showDone = false
                    }, label: {
                        
                        Text("Done")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                        
                    })
                }
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    @State static var showDone = true
    static var previews: some View {
        AccountView(showDone: $showDone)
    }
}

