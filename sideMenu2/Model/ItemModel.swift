//
//  ItemModel.swift
//  Notion-Watch (iOS)
//
//  Created by Nael Alshowaikh on 29.07.22.
//

import Foundation


//!!Immutable Struct --> they will not chnage they have a let --> instead of chnaging it from the viewmodel!!
//in this context it means we cannot chnage these variables unless it is thought eht function updateCompleted
struct ItemModel: Identifiable, Codable {
    //let id: String = UUID().uuidString
    let id: String
    let title: String
    let isCompleted: Bool

    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted

    }

    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }


}
