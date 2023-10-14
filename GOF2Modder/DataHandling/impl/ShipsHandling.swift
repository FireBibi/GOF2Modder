//
//  ShipsHandling.swift
//  GOF2Modder
//
//  Created by BibiFire on 23/08/2023.
//

import Foundation


func parseShips() -> [Ship] {
    
    var ships: [Ship] = []
    do {
        //let bin: URL = Bundle.main.url(forResource: "ships", withExtension: "bin")!
        let fileLength: Int = (try FileManager.default.attributesOfItem(atPath: (binPath! + "/ships.bin") )[.size] as! Int)
        //let fileLength: Int = (try FileManager.default.attributesOfItem(atPath: bin.path)[.size] as! Int)
        
        ships = openFileAndExtractData(filePath: "ships.bin", numberOfBytes: fileLength, numberOfInts: 9).map { item in
            
            return Ship(
                shipName: shipNames[Int(item[0])],
                shipID: item[0],
                hp: item[1],
                cargo: item[2],
                price: item[3],
                primarySlots: item[4],
                secondarySlots: item[5],
                turretSlots: item[6],
                equipmentSlots: item[7],
                handling: item[8])
            
        }
    } catch { writeStringToLogFile("There was an error : \(error)", fileName: "log.txt") }
    
    return ships

}

func writeShips(ships: [Ship]) {
    
    var data: Data = Data()
    let endianness: Endianness = Endianness.BIG
    for ship in ships {
        data.append(writeU32s(u32s: [ship.shipID, ship.hp, ship.cargo, ship.price, ship.primarySlots, ship.secondarySlots, ship.turretSlots, ship.equipmentSlots, ship.handling], endianness: endianness))
    }
    
    
    do {
        
        let url = URL(fileURLWithPath: binPath!).appendingPathComponent("ships.bin")
        let tempURL = tempPath!.appendingPathComponent("ships.bin")
        
        createTempBinFile(data: data, file: tempURL)
        copyFileAsRoot(from: tempURL, to: url)
        
    } catch {writeStringToLogFile("Error : \(error)", fileName: "log.txt") }
    
}


