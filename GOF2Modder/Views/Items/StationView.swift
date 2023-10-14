//
//  StationView.swift
//  GOF2Modder
//
//  Created by Tom on 8/27/23.
//

import SwiftUI



struct StationView: View {
    
    @Binding var station: Station
    
    
    var body: some View {
        Form {
            TextField("", text: $station.name)
            CustomStepperU32(text: "[DANGEROUS] System index", value: $station.systemIndex, step: 1)
            CustomStepperU32(text: "Tech level", value: $station.techLevel, step: 1)
            CustomStepperU32(text: "[DANGEROUS] Texture index:", value: $station.textureIndex, step: 1)
        }
        .navigationTitle(station.name)
    }
    
}

struct StationView_Previews: PreviewProvider {
    static var previews: some View {
        StationView(station: .constant(Station(index: 0, name: "the plush", nameLength: 9,systemIndex: 0, techLevel: 0, textureIndex: 0)))
    }
}
