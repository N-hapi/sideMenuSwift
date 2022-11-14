//
//  sideMenu2App.swift
//  sideMenu2
//
//  Created by Nael Alshowaikh on 18.10.22.
//

import SwiftUI

@main
struct sideMenu2App: App {
   
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    
    var body: some Scene {
        
        WindowGroup {
            NavigationView{
                ContentView()
            
            }.navigationViewStyle(StackNavigationViewStyle()).environmentObject(listViewModel)}
    }}
