//
//  LoginView.swift
//  inneed
//
//  Created by Justin Chester on 2023-09-17.
//

import SwiftUI

struct LoginView: View {
    
    @Binding var userID: String
    
    var body: some View {
        ProgressView()
            .task {
                await login()
            }
    }
    
    private func login() async {
        do {
            let user = try await realmApp.login(credentials: .anonymous)
            userID = user.id
        } catch {
            print("Failed to login: \(error.localizedDescription)")
        }
    }
}
