//
//  ContentView.swift
//  sideMenu2
//
//  Created by Nael Alshowaikh on 18.10.22.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu: Bool = false

    var body: some View {

        NavigationView {
            ZStack {
                Color.mint.ignoresSafeArea(.all, edges: .all)
                Text("Hello, world!")
                    .padding()
                Spacer()
                Button(
                    "Today")
                {
                    //print("yes")
                    NavigationLink("adding", destination: ListView())
                    
                   
                    
                }



                GeometryReader { _ in
                    EmptyView()
                    VStack(alignment: .leading) {
                        //Spacer()
                        SideMenuView()
                            .offset(x: showMenu ? 0 : UIScreen.main.bounds.width - 1000)

                    }.animation(.easeInOut(duration: 0.3), value: showMenu)
                }
                    .background(Color.black.opacity(showMenu ? 0.5 : 0))

            }

                .navigationTitle("side menu demo")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {

                    Button {
                        print("Show menu")
                        self.showMenu.toggle()
                    } label: {

                        if showMenu {

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
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
