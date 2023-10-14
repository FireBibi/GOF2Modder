//
//  ItemsView.swift
//  GOF2Modder
//
//  Created by BibiFire on 30/08/2023.
//

import SwiftUI

struct ItemsView: View {
    
    @State private var items: [Item] = parseItems()
    //@ObservedObject var searchBar: SearchBar = SearchBar()
    
    
    var resetButton: some View {
        Button("Reset") {
            reset("items.bin")
            items = parseItems()
        }
    }
    
    var applyButton: some View {
        Button("Apply") {
            writeItems(items: items)
        }
    }
    
    
    
    var body: some View {
        NavigationView {
            List {
                
                ForEach($items) { $item in
                    NavigationLink {
                        ItemView(item: $item)
                    } label: {
                        Text(String(item.name))
                    }
                }
                
                
            }
            //.add(self.searchBar)
            .navigationBarItems(leading: resetButton, trailing: applyButton)
        }
        
    }
}

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsView()
    }
}
