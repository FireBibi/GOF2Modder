//
//  StationsView.swift
//  GOF2Modder
//
//  Created by BibiFire on 25/08/2023.
//

import SwiftUI

struct StationsView: View {
 
    @State private var stations: [Station] = parseStations()
    //@ObservedObject var searchBar: SearchBar = SearchBar()
    
    // TODO: Add search bar
    var resetButton: some View {
        Button("Reset") {
            reset("stations.bin")
            stations = parseStations()
        }
    }
    
    var applyButton: some View {
        Button("Apply") {
            writeStations(stations: stations)
        }
    }

    var body: some View {
        NavigationView {
            
            List {
                
                ForEach($stations) { $station in
                    NavigationLink {
                        StationView(station: $station)
                    } label: {
                        Text(String(station.name))
                    }
                }
                
                
            }
            //.add(self.searchBar)
            .navigationBarItems(leading: resetButton, trailing: applyButton)
        }
        
    }
    
}

struct StationsView_Previews: PreviewProvider {
    static var previews: some View {
        StationsView()
    }
}
