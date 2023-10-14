//
//  WeaponsHandling.swift
//  GOF2Modder
//
//  Created by BibiFire on 01/10/2023.
//

import Foundation


func parseWeapons() -> [WeaponShip] {
    
    var weaponShips: [WeaponShip] = []
    do {
        let inputURL: URL = URL(fileURLWithPath: binPath!).appendingPathComponent("weapons_hd.bin")
        
        if let file = try? FileHandle(forReadingFrom: inputURL) {
            let endianness: Endianness = Endianness.LITTLE
            var bitsRead: Int = 0
            var size: Int = try FileManager.default.attributesOfItem(atPath: inputURL.path)[.size] as! Int
            
            while bitsRead<(try FileManager.default.attributesOfItem(atPath: inputURL.path)[.size] as! Int) {
                
                let index: UInt16 = readU16(data: try file.read(upToCount: 2)!, endianness: endianness)
                let count: UInt16 = readU16(data: try file.read(upToCount: 2)!, endianness: endianness)
                
                bitsRead += 4
                var weapons: [Weapon] = []
                
                for _ in 0..<count {
                    let type: UInt16 = readU16(data: try file.read(upToCount: 2)!, endianness: endianness)
                    let x: Int16 = readI16(data: try file.read(upToCount: 2)!, endianness: endianness)
                    let y: Int16 = readI16(data: try file.read(upToCount: 2)!, endianness: endianness)
                    let z: Int16 = readI16(data: try file.read(upToCount: 2)!, endianness: endianness)
                    
                    bitsRead += 8
                    var engineSettings: EngineSettings?
                    
                    if type == 3 {
                        engineSettings = EngineSettings(
                            intensity: readF32(data: try file.read(upToCount: 4)!, endianness: endianness),
                            whatever: readF32(data: try file.read(upToCount: 4)!, endianness: endianness),
                            whatever2: readF32(data: try file.read(upToCount: 4)!, endianness: endianness))
                        bitsRead += 12
                    }

                    weapons.append(Weapon(
                        type: type,
                        x: x,
                        y: y,
                        z: z,
                        engineSettings: engineSettings))
                }
                
                weaponShips.append(WeaponShip(
                    index: index,
                    count: count,
                    weapons: weapons))
            }
        }
    } catch {
        writeStringToLogFile("An error occured : \(error)", fileName: "log.txt")
    }
    return weaponShips

}

func writeWeapons(weaponShips: [WeaponShip]) {
    
    var data: Data = Data()
    var endianness: Endianness = Endianness.LITTLE
    for weaponShip in weaponShips {
        data.append(writeU16(u16: weaponShip.index, endianness: endianness))
        data.append(writeU16(u16: weaponShip.count, endianness: endianness))
        
        for weapon in weaponShip.weapons {
            data.append(writeU16(u16: weapon.type, endianness: endianness))
            data.append(writeI16(i16: weapon.x, endianness: endianness))
            data.append(writeI16(i16: weapon.y, endianness: endianness))
            data.append(writeI16(i16: weapon.z, endianness: endianness))
            

            if let settings = weapon.engineSettings {
    
                data.append(writeF32(f32: settings.intensity, endianness: endianness))
                data.append(writeF32(f32: settings.whatever, endianness: endianness))
                data.append(writeF32(f32: settings.whatever2, endianness: endianness))
                
            }
        }
    }
    
    
    do {
        
        let url = URL(fileURLWithPath: binPath!).appendingPathComponent("weapons_hd.bin")
        let tempURL = tempPath!.appendingPathComponent("weapons_hd.bin")
        
        createTempBinFile(data: data, file: tempURL)
        copyFileAsRoot(from: tempURL, to: url)
        
    } catch {writeStringToLogFile("Error : \(error)", fileName: "log.txt") }
    
}


