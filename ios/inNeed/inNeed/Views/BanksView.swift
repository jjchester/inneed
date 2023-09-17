//
//  BanksView.swift
//  inneed
//
//  Created by Justin Chester on 2023-09-17.
//

import SwiftUI
import RealmSwift

struct BanksView: View {
    let userID: String
    //let banks = ["Kitchener", "Waterloo", "Cambridge"]
    @ObservedResults(Bank.self) var banks
    @Environment(\.realm) var realm
    @Environment(\.dismiss) var dismiss
    
    @State private var busy = false
    @State var nameField: String = ""
    @State var addressField: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                List {
                    ForEach(banks, id: \.self) { bank in
                        NavigationLink(destination: Text(bank.name)) {
                            Text(bank.name)
                        }
                    }
                }
            }
            if busy { ProgressView() }
        }
        .navigationTitle("Banks")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                NavigationLink(destination:
                    VStack {
                        TextField("Food bank name", text: $nameField)
                            .padding()
                        TextField("Address", text: $addressField)
                            .padding()
                        Button("Add") {
                            addBank(name: nameField, address: addressField)
                            nameField = ""
                            addressField = ""
                            dismiss()
                        }
                    }
                ) {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 18, height: 18)
                }
            }
        }
        .onAppear {
            Task {
                await subscribe()
            }
        }        
    }
    
    private func addBank(name: String, address: String, photos: RealmSwift.List<String> = List<String>()) {
        let bank = Bank(name: name, address: address, photos: photos)
        $banks.append(bank)
    }
    
    private func subscribe() async {
        let subscriptions = realm.subscriptions
        if subscriptions.first(named: "all-banks") == nil {
            busy = true
            subscriptions.update {
                subscriptions.append(QuerySubscription<Bank>(name:"all-banks"))
            } onComplete: { error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                Task {
                    await setBusy(false)
                }
            }
        }
    }
    
    private func unsubscribe() {
        let subscriptions = realm.subscriptions
        subscriptions.update {
            subscriptions.remove(named: "all-banks")
        } onComplete: { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    private func setBusy(_ value: Bool) {
        busy = value
    }
}
