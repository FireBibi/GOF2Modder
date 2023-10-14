//
//  SystemsHandling.swift
//  GOF2Modder
//
//  Created by BibiFire on 27/08/2023.
//

import Foundation

func parseSystems() -> [System] {
    
    var systems: [System] = []
    let endianness: Endianness = Endianness.BIG
    do {
        let inputURL: URL = URL(fileURLWithPath: binPath!).appendingPathComponent("systems.bin")
        
        if let file = try? FileHandle(forReadingFrom: inputURL) {
            
            var bitsRead: Int = 0
            while bitsRead<(try FileManager.default.attributesOfItem(atPath: inputURL.path)[.size] as! Int) {
                
                var slen: UInt16 = readU16(data: try file.read(upToCount: 2)!, endianness: endianness)
                
                let name: String = readString(data: try file.read(upToCount: Int(slen))!)
                
                let firstData: [UInt32] = readU32s(data: try file.read(upToCount: 52)!, endianness: endianness)
                
                let stations: [UInt32] = readU32s(data: try file.read(upToCount: Int(firstData[12]) * 4)!, endianness: endianness)
                let linkedSystemCount: UInt32 = readU32(data: try file.read(upToCount: 4)!, endianness: endianness)
                var linkedSystems: [UInt32] = []
                
                if linkedSystemCount > 0 {
                    linkedSystems = readU32s(data: try file.read(upToCount: Int(linkedSystemCount) * 4)!, endianness: endianness)
                }
                
                let unkownBytes: [UInt32] = readU32s(data: try file.read(upToCount: 16)!, endianness: endianness)
               
                systems.append(System(
                    name: name,
                    nameLength: slen,
                    riskLevel: firstData[0],
                    unlockedAtStart: firstData[1],
                    faction: firstData[2],
                    xCoordinate: firstData[3],
                    yCoordinate: firstData[4],
                    zCoordinate: firstData[5],
                    jumpgateStation: firstData[6],
                    starColour: firstData[7],
                    unknownBytes: Array(firstData[8...11]),
                    stationsCount: firstData[12],
                    stationIds: stations,
                    linkedSystemsCount: linkedSystemCount,
                    linkedSystems: linkedSystems,
                    footerBytes: unkownBytes))
                
                bitsRead += Int(slen) + 100 + Int(firstData[12]) + Int(linkedSystemCount)
            }
        }
    } catch {
        writeStringToLogFile("\n Error bro \(error)", fileName: "log.txt")
    }

    return systems
}


func writeSystems(systems: [System]) {
    var data: Data = Data()
    let endianness: Endianness = Endianness.BIG
    for system in systems {
        data.append(writeU16(u16: system.nameLength, endianness: endianness))
        data.append(writeString(string: system.name))
        data.append(writeU32s(u32s: [system.riskLevel, system.unlockedAtStart, system.faction, system.xCoordinate, system.yCoordinate, system.zCoordinate, system.jumpgateStation, system.starColour], endianness: endianness))
        data.append(writeU32s(u32s: system.unknownBytes, endianness: endianness))
        data.append(writeU32(u32: system.stationsCount, endianness: endianness))
        data.append(writeU32s(u32s: system.stationIds, endianness: endianness))
        data.append(writeU32(u32: system.linkedSystemsCount, endianness: endianness))
        data.append(writeU32s(u32s: system.linkedSystems, endianness: endianness))
        data.append(writeU32s(u32s: system.footerBytes, endianness: endianness))
    }
    
    do {
        let url = URL(fileURLWithPath: binPath!).appendingPathComponent("systems.bin")
        let tempURL = tempPath!.appendingPathComponent("systems.bin")
        createTempBinFile(data: data, file: tempURL)
        
        copyFileAsRoot(from: tempURL, to: url)
        
    } catch {writeStringToLogFile("Error : \(error)", fileName: "log.txt")}
}
