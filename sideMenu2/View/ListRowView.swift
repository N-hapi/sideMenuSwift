//
//  ListRowView.swift
//  Notion-Watch (iOS)
//
//  Created by Nael Alshowaikh on 28.07.22.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle": "circle").foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "for testing", isCompleted: true)
    static var item2 = ItemModel(title: "for testing 2", isCompleted: true)
    
    
    static var previews: some View {
        //ListRowView(title: "something 2")
        Group{
            ListRowView(item: item1)
            ListRowView(item: item2)
            
        }
    }
}
