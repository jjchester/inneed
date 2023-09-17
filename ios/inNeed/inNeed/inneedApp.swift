//
//  inneedApp.swift
//  inneed
//
//  Created by Justin Chester on 2023-09-15.
//

import SwiftUI
import RealmSwift

let realmApp = RealmSwift.App(id: "inneed-byita")

@main
struct inneedApp: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
