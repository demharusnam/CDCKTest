//
//  AddItemView.swift
//  CDCKTest
//
//  Created by Mansur Ahmed on 2021-08-06.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.presentationMode) var presentationMode
    @State private var author: String = ""
    @State private var message: String = ""
        
    var body: some View {
        NavigationView {
            Form {
                TextField("Author", text: $author)
                
                TextField("Message", text: $message)
            }
            .navigationBarItems(
                leading:
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    },
                trailing:
                    Button("Add Item") {
                        addItem()
                        presentationMode.wrappedValue.dismiss()
                    }
                    .disabled(author.isEmpty || message.isEmpty)
            )
            .navigationTitle("New Item")
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.name = author
            newItem.message = message

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
