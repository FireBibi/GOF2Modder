//
//  SystemsView.swift
//  GOF2Modder
//
//  Created by BibiFIre on 25/08/2023.
//

import SwiftUI

struct SystemsView: View {

    @State private var systems: [System] = parseSystems()
    
    //@ObservedObject var searchBar: SearchBar = SearchBar()
    
    // TODO: Add search bar
    var resetButton: some View {
        Button("Reset") {
            reset("systems.bin")
            systems = parseSystems()
        }
    }
    
    var applyButton: some View {
        Button("Apply") {
            writeSystems(systems: systems)
        }
    }
    
    var body: some View {
        
        NavigationView {
                
                
                List {
                    
                    ForEach($systems) { $system in
                        NavigationLink {
                            SystemView(system: $system)
                        } label: {
                            Text(String(system.name))
                        }
                    }
                    
                    
                }
                //.add(self.searchBar)
                .navigationBarItems(leading: resetButton, trailing: applyButton)
        }
        
    }
}

struct SystemsView_Previews: PreviewProvider {
    static var previews: some View {
        SystemsView()
    }
}
