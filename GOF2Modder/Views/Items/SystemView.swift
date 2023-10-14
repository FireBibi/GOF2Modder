//
//  SystemView.swift
//  GOF2Modder
//
//  Created by BibiFire on 27/08/2023.
//

import SwiftUI

struct SystemView: View {
    @Binding var system: System
    
    let starColourOptions: [Option] = [
        Option(value: starColourGreen, label: "Green"),
        Option(value: starColourOrange, label: "Orange"),
        Option(value: starColourLightGreen, label: "Light Green"),
        Option(value: starColourPink, label: "Pink"),
        Option(value: starColourLightLightGreen, label: "Very light green"),
        Option(value: starColourRed, label: "Red"),
        Option(value: starColourShinnyGreen, label: "Shinny Green"),
        Option(value: starColourYellow, label: "Yellow"),
        Option(value: starColourShinyBlue, label: "Shinny Blue"),
        Option(value: starColourWhite, label: "White"),
        Option(value: starColourShinyOrange, label: "Shinny Orange"),
        Option(value: starColourLightBlue, label: "Light Blue"),
        Option(value: starColourSmallShinyGreen, label: "Small Shinny Green"),
        Option(value: starColourSmallGreen, label: "Small Green"),
        Option(value: starColourRedOrange, label: "Red-Orange"),
        Option(value: starColourShinnyYellow, label: "Shinny Yellow"),
        Option(value: starColourBigLightGreen, label: "Big Light Green"),
        Option(value: starColourPaleGreen, label: "Pale Green")
        
    ]
    
    let riskLevelOptions: [Option] = [
        Option(value: dangerousSystem, label: "Dangerous"),
        Option(value: riskySystem, label: "Risky"),
        Option(value: averageSystem, label: "Average"),
        Option(value: secureSystem, label: "Secure")
    ]
    
    let factionOptions: [Option] = [
        Option(value: terran, label: "Terran"),
        Option(value: vossk, label: "Vossk"),
        Option(value: nivelian, label: "Nivelian"),
        Option(value: midorian, label: "Midorian")
    ]
    

    
    
    var body: some View {
        Form {
            Picker("", selection: $system.riskLevel) {
                ForEach(riskLevelOptions, id: \.value) { option in
                    /*@START_MENU_TOKEN@*/Text(option.label)/*@END_MENU_TOKEN@*/
                }
            }.pickerStyle(.segmented)
            Picker("", selection: $system.faction) {
                ForEach(factionOptions, id: \.value) { option in
                    /*@START_MENU_TOKEN@*/Text(option.label)/*@END_MENU_TOKEN@*/
                }
            }.pickerStyle(.segmented)
            Picker("Star Colour", selection: $system.starColour) {
                ForEach(starColourOptions, id: \.value) { colour in
                    Text(colour.label)
                }
            }.pickerStyle(.automatic)
                
            
            
            Text("Linked Systems :  \(getLinkedSystems(system: system).joined(separator: ", "))")
            
            Text("Stations : \(getStations(system:system).joined(separator: ", "))")
            
            
            .navigationTitle(system.name)
            
        }

    }
        /*Form {
            TextField("", text: $system.name)
            Stepper("System index: \(system.systemIndex)", value: $system.systemIndex, in: 0...33)
            Stepper("Tech level: \(system.techLevel)", value: $system.techLevel, in: 0...10)
            Stepper("Texture index: \(system.textureIndex)", value: $system.textureIndex, in: 0...26)
        }*/
        
    
}

struct SystemView_Previews: PreviewProvider {
    static var previews: some View {
        SystemView(system: .constant(System(name: "Fire", nameLength: 4, riskLevel: 0, unlockedAtStart: 0, faction: 0, xCoordinate: 0, yCoordinate: 0, zCoordinate: 0, jumpgateStation: 0, starColour: 0, unknownBytes: [0], stationsCount: 0, stationIds: [0], linkedSystemsCount: 0, linkedSystems: [0], footerBytes: [0])))
    }
}

enum starColour: UInt32 {
    
    case Green = 0x0
    case Orange = 0x1
    case Pink = 0x3
    case Red = 0x5
    case Yellow = 0x7
    case White = 0x9
    
}



