//
//  ItemDetailView.swift
//  CDCKTest
//
//  Created by Mansur Ahmed on 2021-08-06.
//

import SwiftUI

struct ItemDetailView: View {
    let item: SyncedItem
    
    var body: some View {
        VStack {
            Text(item.message)
                .font(.largeTitle)
                .bold()
            
            Text("by: " + item.author)
                .font(.footnote)
        }
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        return ItemDetailView(item: SyncedItem.preview)
    }
}
