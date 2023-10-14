//
//  System.swift
//  GOF2Modder
//
//  Created by BibiFire on 27/08/2023.
//

import Foundation


struct System: Identifiable {
    var id: String {
        self.name
    }
    
    var name: String
    var nameLength: UInt16
    var riskLevel: UInt32
    var unlockedAtStart: UInt32
    var faction: UInt32
    var xCoordinate: UInt32
    var yCoordinate: UInt32
    var zCoordinate: UInt32
    var jumpgateStation: UInt32
    var starColour: UInt32
    var unknownBytes: [UInt32]
    var stationsCount: UInt32
    var stationIds: [UInt32]
    var linkedSystemsCount: UInt32
    var linkedSystems: [UInt32]
    var footerBytes: [UInt32]
    
    
}

func getLinkedSystems(system: System) -> [String] {
    var linkedSystems: [String] = []
    
    /*linkedSystems = system.linkedSystems.map {
        Option(value: $0, label:
                getValueOrGetLast(index: Int($0), array: systemsNames) as! String
        )
    }*/
    
    linkedSystems = system.linkedSystems.map { systemsNames[Int($0)] }
    
    return linkedSystems
    
}

func getStations(system: System) -> [String] {
    return system.stationIds.map { systemsNames[Int($0)] }
}

