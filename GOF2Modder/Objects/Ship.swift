//
//  Ship.swift
//  GOF2Modder
//
//  Created by BibiFire on 24/08/2023.
//

import Foundation

struct Ship: Identifiable {
    var id: UInt32 {
        self.shipID
    }
    
    var shipName: String
    var shipID: UInt32
    var hp: UInt32
    var cargo: UInt32
    var price: UInt32
    var primarySlots: UInt32
    var secondarySlots: UInt32
    var turretSlots: UInt32
    var equipmentSlots: UInt32
    var handling: UInt32
}

