//
//  ListViewModel.swift
//  Notion-Watch (iOS)
//
//  Created by Nael Alshowaikh on 01.08.22.
//


/*
 this is A CRUD function here
 create
 read
 update
 delte
 
 */

import Foundation

class ListViewModel: ObservableObject {
    //everytime the array is chnaged i want it to call the savewd func
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }

    }
    let itemsKey: String = "items_list"

    init() {
        getItems()
    }

    func getItems() {
        //!! no longer using the fake data now we will use userDefualts
//    let newItems = [
//        ItemModel(title: "Checking", isCompleted: true),
//        ItemModel(title: "Checking 2", isCompleted: false)
//    ]
//    items.append(contentsOf: newItems)

        guard let data = UserDefaults.standard.data(forKey: itemsKey) else {
            return
        }

        //now we have to dencode hte data so the opposite of what we did in the function data back to items
        guard let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)else {
            return
        }
        self.items = savedItems
    }
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }

    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }

    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }

    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { (existingItem) -> Bool in
            return existingItem.id == item.id
        }) {
            items[index] = item.updateCompletion()
            // moved down because we do the update withing the item model and not outside it
            //ItemModel(title: item.title, isCompleted: !item.isCompleted)
        }
    }

    func saveItems() {
        //because this needs Json it cannot be saved to user defaults
        //UserDefaults.standard
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
