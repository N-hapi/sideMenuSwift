//
//  AddView.swift
//  Notion-Watch (iOS)
//
//  Created by Nael Alshowaikh on 28.07.22.
//

import SwiftUI

struct AddView: View {
    //to go back after pressing add
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    //for alerts
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            VStack {
                TextField("add txt here", text: $textFieldText)
                    .background(Color.gray)
                    .frame(height: 50 )
                    .cornerRadius(100)
                    .padding(.horizontal)
            }.padding(3.0).frame(width: nil)
            Button(
                action: saveButtonPressed
                , label: {
                    Text("Save")
                }).foregroundColor(.white)
                .background(.black)
                .frame(height: 55)
                .cornerRadius(10)
            
        }.navigationTitle("Add an iteam")
            .alert(isPresented: $showAlert, content:getAlert
                
            )
        
    }
    func saveButtonPressed(){
        listViewModel.addItem(title: textFieldText)
        presentationMode.wrappedValue.dismiss()
        showAlert.toggle()
        
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text("Added Task"))
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }.environmentObject(ListViewModel())
        
    }
}
