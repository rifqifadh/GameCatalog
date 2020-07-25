//
//  SearchField.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 05/07/20.
//

import SwiftUI

struct SearchField: View {
    
    @Binding var searchText: String
    var placeholder = "Search..."
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .imageScale(.large)
                .foregroundColor(.white)
            TextField(placeholder, text: $searchText)
                .foregroundColor(Color("Text"))
                .font(.headline)
//                .accentColor(Color("SecondaryVariant"))
                .textCase(nil)
            if !searchText.isEmpty {
                Button(action: {
                    self.searchText = ""
                }) {
                    Image(systemName: "xmark.circle")
                        .font(.headline)
                        .foregroundColor(.red)
                        .imageScale(.large)
                }.buttonStyle(BorderlessButtonStyle())
            }
        }
        .padding(8)
//        .background(Color("SecondaryVariant"))
        .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
        .padding(2)
//        .listRowBackground(Color("Primary"))
    }
    
}

struct SearchField_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            List {
                Section(header: SearchField(searchText: .constant("GTA"))) {
                    SearchField(searchText: .constant("GTA"))
                }
            }.listStyle(InsetGroupedListStyle())
        }
    }
}
