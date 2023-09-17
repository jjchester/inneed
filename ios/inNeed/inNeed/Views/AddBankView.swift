////
////  AddBankView.swift
////  inneed
////
////  Created by Justin Chester on 2023-09-17.
////
//
//import SwiftUI
//import RealmSwift
//
//struct AddBankView: View {
//
//    @State var nameField: String = ""
//    @State var addressField: String = ""
//    @Environment(\.dismiss) private var dismiss
//    @ObservedResults(Bank.self) var banks
//
//    var body: some View {
//        VStack {
//            TextField("Food bank name", text: $nameField)
//                .padding()
//            TextField("Address", text: $addressField)
//                .padding()
//            Button("Add") {
//                addBank(name: nameField, address: addressField)
//                nameField = ""
//                addressField = ""
//                dismiss()
//            }
//        }
//    }
//
//    private func addBank(name: String, address: String, photos: RealmSwift.List<String> = List<String>()) {
//        let bank = Bank(name: name, address: address, photos: photos)
//        $banks.append(bank)
//    }
//}
//
//struct AddBankView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddBankView()
//    }
//}
