//
//  Bank.swift
//  inneed
//
//  Created by Justin Chester on 2023-09-17.
//

import Foundation
import RealmSwift

class Bank: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String
    @Persisted var address: String
    @Persisted var dateCreated = Date()
    @Persisted var photos: List<String> // Array of URLs
    // hours of operation
    // photo(s)
    // location (coords for map?)
    
    convenience init(name: String, address: String, photos: List<String> = List<String>()) {
        self.init()
        self.name = name
        self.address = address
        self.photos = photos
    }
}
