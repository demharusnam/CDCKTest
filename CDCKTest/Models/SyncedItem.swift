//
//  SyncedItem.swift
//  CDCKTest
//
//  Created by Mansur Ahmed on 2021-08-06.
//

import SwiftUI

class SyncedItem: Identifiable {
    var author: String
    var message: String
    var timeStamp: Date
    
    init(author: String, message: String, timeStamp: Date) {
        self.author = author
        self.message = message
        self.timeStamp = timeStamp
    }
    
    static let preview: SyncedItem = SyncedItem(author: "Kratos", message: "BOY!", timeStamp: Date())
}
