//
//  SideMenuView.swift
//  sideMenu2
//
//  Created by Nael Alshowaikh on 19.10.22.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
       // NavigationView{
        VStack {
                Text("Overview")
                    .font(.title)
                    .foregroundColor(.white)
                
                
                
                Button(
                    "Today")
                {
                    print("yes")
                    
                   
                    
                }
                //.padding(30)
                .frame(width: 100, height: 100)
                //.font(.title)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
                
                Spacer()
                
                
            }
            .padding(50)
            .background(Color.black)
            .edgesIgnoringSafeArea(.bottom)
            
        //}
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
