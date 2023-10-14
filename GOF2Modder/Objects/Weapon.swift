//
//  Weapon.swift
//  GOF2Modder
//
//  Created by BibiFire on 01/10/2023.
//

import Foundation

struct WeaponShip: Identifiable {
    var id: UInt16 {
        self.index
    }
    var index: UInt16
    var count: UInt16
    var weapons: [Weapon]
}

struct Weapon: Identifiable {
    var id: Int16 {
        self.x
    }
    
    var type: UInt16
    var x: Int16
    var y: Int16
    var z: Int16
    var engineSettings: EngineSettings?
}

struct EngineSettings: Identifiable {
    var id: Float32 {
        self.intensity
    }
    
    var intensity: Float32
    var whatever: Float32
    var whatever2: Float32
}
