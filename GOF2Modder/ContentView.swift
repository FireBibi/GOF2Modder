//
//  ContentView.swift
//  GOF2Modder
//
//  Created by BibiFire on 23/08/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        if appInited {
            TabView {
                ShipsView()
                    .tabItem {
                        Label("Ships", systemImage: "airplane")
                    }
                SystemsView()
                    .tabItem {
                        Label("Systems", systemImage: "globe")
                    }
                
                StationsView()
                    .tabItem {
                        Label("Stations", systemImage: "house.fill")
                    }
                ItemsView()
                    .tabItem {
                        Label("Items", systemImage: "wrench.fill")
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
