//
//  AccountSettingsView.swift
//  AppMusic
//
//  Created by David Furtado on 16/03/23.
//

import SwiftUI

struct AccountSettingsView: View {
    @State var appleID = "david@gmail.com"
    @State var isPersonalised = true
    @State var isAllow = false
    
    @Binding var showEditProfile:Bool
    
    let rodapeAppleID = "Editing your Apple ID and password will take you to appleid.apple.com"
    let rodapePersonalised = "When turned on, your app usage, downloads, purchases and other activity will be used to improve your recommendations in the App Store, Apple Books, Itunes Store, Apple TV, Apple Podcasts and for subscriptions from Apple."
    let rodapeAllow = "People who have your phone number or email address will see you as someone they can follow on Apple Music. We will never show your contact information."
    let rodapeAccount = "Manage third-party services that have access to your apps."
    let rodapeDownload = "Unhide purchases that you have previously hidden."
    let rodapeRemove = "This device may be used with Automatic Downloads and can also download previously purchased apps and content."
    let rodape = "Apple uses industry-standard encryption to protect the confidentiality of your personal information."
    
    var body: some View {
        NavigationView {
            VStack{
                Form{
                    Group{
                        Section(footer: Text(rodapeAppleID)){
                            HStack{
                                Text("Apple ID")
                                Spacer()
                                TextField("Apple ID", text: $appleID)
                            }
                        }
                        Section{
                            HStack{
                                NavigationLink(destination: Text("Family Sharing")){
                                    Text("Family Sharing")
                                }
                            }
                            
                            HStack{
                                NavigationLink(destination: Text("Manage Payments")){
                                    Text("Manage Payments")
                                }
                            }
                            
                            HStack{
                                NavigationLink(destination: Text("Country/Region")){
                                    Text("Country/Region")
                                }
                            }
                        }
                        Section{
                            HStack{
                                NavigationLink(destination: Text("Ratings and Reviews")){
                                    Text("Ratings and Reviews")
                                }
                            }
                        }
                        Section(footer: Text(rodapePersonalised)){
                            Toggle("Personalised Recommendations", isOn: $isPersonalised)
                        }
                        Section(footer: Text(rodapeAllow)){
                            Toggle("Allow Friends to Find You", isOn: $isAllow)
                        }
                    }
                    Group{
                        Section{
                            HStack{
                                NavigationLink(destination: Text("Subscriptions")){
                                    Text("Subscriptions")
                                }
                            }
                            HStack{
                                NavigationLink(destination: Text("Purchase History")){
                                    Text("Purchase History")
                                }
                            }
                        }
                        Section(header: Text("ACCOUNT ACCESS"), footer: Text(rodapeAccount)){
                            HStack{
                                NavigationLink(destination: Text("Apple Music")){
                                    Text("Apple Music")
                                }
                            }
                        }
                        Section(header: Text("DOWNLOADS AND PURCHASES"), footer: Text(rodapeDownload)){
                            HStack{
                                NavigationLink(destination: Text("Hidden Purchases")){
                                    Text("Hidden Purchases")
                                }
                            }
                        }
                        Section(footer: Text(rodapeRemove)){
                            HStack{
                                NavigationLink(destination: Text("Remove This Device")){
                                    Text("Remove This Device")
                                }
                            }
                        }
                        Section(header: Text("NEWSLETTERS AND SPECIAL OFFERS")){
                            Button(action: {}, label: {
                                Text("Manage")
                            })
                        }
                        Section(footer: Text(rodape)){
                            Button(action: {}, label: {
                                Text("Terms of Service")
                            })
                            Button(action: {}, label: {
                                Text("Privacy Policy")
                            })
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement: .principal) {
                Text("Account Settings")
                    .font(.body)
                    .fontWeight(.heavy)
                    .foregroundColor(.primary)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    showEditProfile = false
                }, label: {
                    
                    Text("Done")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                })
            }
        }
    }
}

struct AccountSettingsView_Previews: PreviewProvider {
    @State static var showEditProfile = true
    static var previews: some View {
        AccountSettingsView(showEditProfile: $showEditProfile)
    }
}
