//
//  ListView2.swift
//  sideMenu2
//
//  Created by Nael Alshowaikh on 13.11.22.
//

//
//  ListView.swift
//  Notion-Watch (iOS)
//
//  Created by Nael Alshowaikh on 28.07.22.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    // removed because now we are using the items that are in the array
//    @State var items:[ItemModel] = [
//        ItemModel(title: "Checking", isCompleted: true),
//        ItemModel(title: "Checking 2", isCompleted: false)
//    ]
    
    var body: some View {
        NavigationView {
            ZStack{
                if listViewModel.items.isEmpty{
                    Text("no items")
                }
                else{
                    List{
                        //Now we can loop in each item
                        ForEach(listViewModel.items){
                            item in
                            ListRowView(item: item)
                                .onTapGesture {
                                    withAnimation(.linear){
                                        listViewModel.updateItem(item: item)
                                    }
                                }
                           // items in ListRowView(title: items)
                            //Text("hello")
                        }.onDelete(perform: listViewModel.deleteItem)
                            .onMove(perform: listViewModel.moveItem)
                        
                        //ListRowView(title: "something")
                        
                    }
                }
             
                
            }
        
                .navigationBarItems(
                    leading: EditButton(),
                    trailing:
                        NavigationLink("add", destination:AddView()))
                .listStyle(InsetGroupedListStyle())}.navigationViewStyle(StackNavigationViewStyle()).navigationTitle("Today's Todo")
    }
    func deleteItem(indexSet: IndexSet ){
        listViewModel.items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        listViewModel.items.move(fromOffsets: from, toOffset: to)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView
        {
            ListView()
            
        }.environmentObject(ListViewModel())
    }
}



