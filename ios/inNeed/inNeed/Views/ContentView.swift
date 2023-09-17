//
//  ContentView.swift
//  inneed
//
//  Created by Justin Chester on 2023-09-15.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userID: String = ""
    
    var body: some View {
        NavigationView {
            if userID == "" {
                LoginView(userID: $userID)
            } else {
                if let realmUser = realmApp.currentUser {
                    BanksView(userID: userID)
                        .environment(\.realmConfiguration, realmUser.flexibleSyncConfiguration())
                }
            }
        }
    }
}
