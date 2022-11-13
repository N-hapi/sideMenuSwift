//
//  ListView.swift
//  sideMenu2
//
//  Created by Nael Alshowaikh on 19.10.22.
//

import SwiftUI

struct ListView: View {
    @StateObject var showMenu = sideMenuClass()
    var body: some View {
        GeometryReader { _ in
             
             VStack(alignment: .leading) {
                 //Spacer()
                 SideMenuView()
                     .offset(x: showMenu.showMenu ? 0 : UIScreen.main.bounds.width - 1000)

             }.animation(.easeInOut(duration: 0.3), value: showMenu.showMenu)
         }
             .background(Color.black.opacity(showMenu.showMenu ? 0.5 : 0))
             .navigationTitle("side menu demo")
             .navigationBarTitleDisplayMode(.inline)
             .toolbar {
             ToolbarItem(placement: .navigationBarLeading) {
                 Button {
                     print("Show menu")
                     self.showMenu.showMenu.toggle()
                 } label: {
                     if showMenu.showMenu {
                         Image(systemName: "xmark")
                             .font(.title)
                             .foregroundColor(.blue) }
                     else {
                         Image(systemName: "text.justify")
                             .font(.title)
                             .foregroundColor(.blue) }
                 }
             }
         }
    }
        
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
