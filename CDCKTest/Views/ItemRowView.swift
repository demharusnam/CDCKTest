//
//  ItemRowView.swift
//  CDCKTest
//
//  Created by Mansur Ahmed on 2021-08-06.
//

import SwiftUI

struct ItemRowView: View {
    var item: SyncedItem
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Item at \(item.timeStamp, formatter: itemFormatter)")
            
            Text("by \(item.author)")
                .font(.caption)
        }
    }
    
    private let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        return ItemRowView(item: SyncedItem.preview)
    }
}
