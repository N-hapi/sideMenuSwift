//
//  SideMenuView.swift
//  sideMenu2
//
//  Created by Nael Alshowaikh on 19.10.22.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack {
            Text("settings")
                .font(.title)
                .foregroundColor(.white)
            Spacer()
        }
            .padding(32)
            .background(Color.black)
            .edgesIgnoringSafeArea(.bottom)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
