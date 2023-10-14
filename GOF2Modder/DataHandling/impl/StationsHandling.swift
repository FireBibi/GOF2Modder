//
//  StationsHandling.swift
//  GOFModder
//
//  Created by BibiFire on //.
//

import Foundation

extension Data {
    var hexDescription: String {
        return reduce("") {$0 + String(format: "%02x", $1)}
    }
}

func parseStations() -> [Station] {
    
    var stations: [Station] = []
    do {
        let inputURL: URL = URL(fileURLWithPath: binPath!).appendingPathComponent("stations.bin")
        let endianness: Endianness = Endianness.BIG
        if let file = try? FileHandle(forReadingFrom: inputURL) {
            
            var bitsRead: Int = 0
            
            while bitsRead<(try FileManager.default.attributesOfItem(atPath: inputURL.path)[.size] as! Int) {
                
                var slen: UInt16 = readU16(data: try file.read(upToCount: 2)!, endianness: endianness)
                let name: String = readString(data: try file.read(upToCount: Int(slen))!)
                let rest: [UInt32] = readU32s(data: try file.read(upToCount: 16)!, endianness: endianness)
                
                bitsRead += Int(slen) + 18
                
                stations.append(Station(
                    index: rest[0],
                    name: name,
                    nameLength: slen,
                    systemIndex: rest[1],
                    techLevel: rest[2],
                    textureIndex: rest[3]))
            }
        }
    } catch {
        writeStringToLogFile("Error \(error)", fileName: "log.txt")
    }

    return stations

}


func writeStations(stations: [Station]) {
    var data: Data = Data()
    let endianness: Endianness = Endianness.BIG
    for station in stations {
        data.append(writeU16(u16: station.nameLength, endianness: endianness))
        data.append(writeString(string: station.name))
        data.append(writeU32s(u32s: [station.index, station.systemIndex, station.techLevel, station.textureIndex], endianness: endianness))
    }
    
    do {

        let url = URL(fileURLWithPath: binPath!).appendingPathComponent("stations.bin")
        let tempURL = tempPath!.appendingPathComponent("stations.bin")
        
        createTempBinFile(data: data, file: tempURL)
        copyFileAsRoot(from: tempURL, to: url)
        
    } catch {writeStringToLogFile("Error : \(error)", fileName: "log.txt")}
}
