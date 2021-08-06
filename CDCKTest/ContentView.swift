//
//  ContentView.swift
//  CDCKTest
//
//  Created by Mansur Ahmed on 2021-08-06.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    private var syncedItems: [SyncedItem] {
        items.map {
            SyncedItem(author: $0.name!, message: $0.message!, timeStamp: $0.timestamp!)
        }
    }
    
    @State private var isShowingSheet: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(syncedItems) { item in
                    NavigationLink(destination: ItemDetailView(item: item)) {
                        ItemRowView(item: item)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                Button(action: { isShowingSheet = true }) {
                    Label("Add Item", systemImage: "plus")
                }
            }
            .navigationTitle("Synced List")
            .sheet(isPresented: $isShowingSheet) {
                AddItemView()
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets
                .map { items[$0] }
                .forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                print("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
