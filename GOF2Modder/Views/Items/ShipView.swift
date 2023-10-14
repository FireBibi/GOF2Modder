//
//  ShipView.swift
//  GOF2Modder
//
//  Created by BibiFire on 23/08/2023.
//

import SwiftUI


struct ShipView: View {
    
    @Binding var ship: Ship
    @Binding var weaponShip: WeaponShip
    
    
    var body: some View {
        Form {
            CustomStepperU32(text: "HP", value: $ship.hp, step: 10)
            CustomStepperU32(text: "Cargo", value: $ship.cargo, step: 50)
            CustomStepperU32(text: "Price", value: $ship.price, step: 1000)
            CustomStepperU32(text: "Primary Weapons", value: $ship.primarySlots, step: 1)
            CustomStepperU32(text: "Secondary Weapons", value: $ship.secondarySlots, step: 1)
            CustomStepperU32(text: "Turret Slots", value: $ship.turretSlots, step: 1)
            CustomStepperU32(text: "Equipment Slots", value: $ship.equipmentSlots, step: 1)
            CustomStepperU32(text: "Handling", value: $ship.handling, step: 5)
            
            NavigationLink {
                if let weapon = $weaponShip {
                    WeaponView(weaponShip: weapon)
                }
                
            } label : { Text("Weapons") }
        }
        .navigationTitle(ship.shipName)
    }
    
}

struct ShipView_Previews: PreviewProvider {
    static var previews: some View {
        ShipView(ship: .constant(Ship(shipName: "Hey", shipID: 0, hp: 0, cargo: 0, price: 0, primarySlots: 0, secondarySlots: 0, turretSlots: 0, equipmentSlots: 0, handling: 0)), weaponShip: .constant(WeaponShip(index: 0, count: 0, weapons: [])))
    }
}
