//
//  ShipsView.swift
//  GOF2Modder
//
//  Created by BibiFire on 23/08/2023.
//

import SwiftUI

struct ShipsView: View {
    
    @State var ships: [Ship] = parseShips()
    @State var weaponsShips: [WeaponShip] = parseWeapons()
    
    //@ObservedObject var searchBar: SearchBar = SearchBar()
    
    // TODO: Add search bar
    var resetButton: some View {
        Button("Reset") {
            reset("ships.bin")
            reset("weapons_hd.bin")
            ships = parseShips()
            weaponsShips = parseWeapons()
        }
    }
    
    var applyButton: some View {
        Button("Apply") {
            writeShips(ships: ships)
            writeWeapons(weaponShips: weaponsShips)
        }
    }
    
    
    func findWeaponShip(for ship: Ship) -> Binding<WeaponShip>? {
        do {
            if let index = try weaponsShips.firstIndex(where: { $0.id == ship.id }) {
                return $weaponsShips[index]
            }
            return nil
        } catch { writeStringToLogFile("Error : \(error)", fileName: "log.txt")}

    }

    
    var body: some View {
        NavigationView {
            
            List {
                
                ForEach($ships) { $ship in
                        if let weaponShip = findWeaponShip(for: ship) {
                            NavigationLink {
              
                                ShipView(ship: $ship, weaponShip: weaponShip)
                                
                            } label: {
                                Text(String(ship.shipName))
                            }
                    }

                }
                
            }
            .navigationBarItems(leading: resetButton, trailing: applyButton)
            //.add(self.searchBar)
        
        }
        
    }
    
}

struct ShipsView_Previews: PreviewProvider {
    static var previews: some View {
        ShipsView()
    }
}
