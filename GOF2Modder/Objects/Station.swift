//
//  Station.swift
//  GOF2Modder
//
//  Created by BibiFire on 25/08/2023.
//

import Foundation

struct Station: Identifiable {
    var id: String {
        self.name
    }
    
    var index: UInt32
    var name: String
    var nameLength: UInt16
    var systemIndex: UInt32
    var techLevel: UInt32
    var textureIndex: UInt32
}
