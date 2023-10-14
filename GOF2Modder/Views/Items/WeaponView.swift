//
//  WeaponView.swift
//  GOF2Modder
//
//  Created by BibiFire on 01/10/2023.
//

import SwiftUI

struct WeaponView: View {
    @Binding var weaponShip: WeaponShip
    
    func deleteItem(at offsets: IndexSet) {
        weaponShip.weapons.remove(atOffsets: offsets)
        weaponShip.count-=1
    }
    
    var body: some View {
        Form {
            
            Section(header: Text("Primary Weapons")) { // Primary Weapons
                //Stepper()
                ForEach($weaponShip.weapons) { $weapon in
                    if weapon.type == 0 {
                        NavigationLink {
                            WeaponEditingView(weaponSettings: $weapon)
                        } label: { Text("Primary Weapons")}
                    }
                }.onDelete(perform: deleteItem)
                Button("Add new primary weapon") {
                    weaponShip.weapons.append(Weapon(type: 0, x: 0, y: 0, z: 0))
                    weaponShip.count+=1
                }
                .foregroundColor(.blue)
            }
            
            Section(header: Text("Secondary Weapons")) { // Secondary Weapons
                ForEach($weaponShip.weapons) { $weapon in
                    if weapon.type == 1 {
                        NavigationLink {
                            WeaponEditingView(weaponSettings: $weapon)
                        } label: { Text("Secondary Weapons")}
                    }
                }.onDelete(perform: deleteItem)
                Button("Add new secondary weapon") {
                    weaponShip.weapons.append(Weapon(type: 1, x: 0, y: 0, z: 0))
                    weaponShip.count+=1
                }
                .foregroundColor(.blue)
            }
            
            Section(header: Text("Turrets")) { // Turrets
                ForEach($weaponShip.weapons) { $weapon in
                    if weapon.type == 2 {
                        NavigationLink {
                            WeaponEditingView(weaponSettings: $weapon)
                        } label: { Text("Turrets")}
                    }
                }.onDelete(perform: deleteItem)
                Button("Add new turret") {
                    weaponShip.weapons.append(Weapon(type: 2, x: 0, y: 0, z: 0))
                    weaponShip.count+=1
                }
                .foregroundColor(.blue)
            }
            
            Section(header: Text("Engines")) { // Engines
                ForEach($weaponShip.weapons) { $weapon in
                    if weapon.type == 3 {
                        NavigationLink {
                            WeaponEditingView(weaponSettings: $weapon)
                        } label: { Text("Engines")}
                    }
                }.onDelete(perform: deleteItem)
                Button("Add new engine") {
                    weaponShip.weapons.append(Weapon(type: 3, x: 0, y: 0, z: 0, engineSettings: EngineSettings(intensity: 1, whatever: 1, whatever2: 1)))
                    weaponShip.count+=1
                }
                .foregroundColor(.blue)
            }
        }
    }
}

struct WeaponView_Previews: PreviewProvider {
    static var previews: some View {
        WeaponView(weaponShip: .constant(WeaponShip(index: 0, count: 0, weapons: [])))
    }
}
