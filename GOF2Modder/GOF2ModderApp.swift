//
//  GOF2ModderApp.swift
//  GOF2Modder
//
//  Created by BibiFire on 23/08/2023.
//

import SwiftUI

@main
struct GOF2ModderApp: App {

    
    var body: some Scene {
        WindowGroup {
            
            if initApp() {
                ContentView()
            }
            
            if shouldDisplayError {
                Text("An Error occured").alert(isPresented: .constant(true)) {
                    Alert(title: Text("An error occured !"), message: Text(errorToShow), dismissButton: Alert.Button.default(Text("Exit"), action: { exit(-1) } ))
                }

            }


        }

    }
    
}

