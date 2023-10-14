//
//  CommonHandling.swift
//  GOF2Modder
//
//  Created by BibiFire on 24/08/2023.
//

import SwiftUI



func openFileAndExtractData(filePath: String, numberOfBytes: Int, numberOfInts: Int) -> [[UInt32]] {
    var data: [[UInt32]] = []
    do {

        let fileURL = try URL(fileURLWithPath: binPath!).appendingPathComponent(filePath)

        if let file = try? FileHandle(forReadingFrom: fileURL) {
            
            var i: Int = 0
            while i<numberOfBytes {
                
                guard let chunk = try file.read(upToCount: 36) else {return data}
                
                data.append(readU32s(data: chunk, endianness: Endianness.BIG))
                i+=36
            }
        }
    } catch {
        writeStringToLogFile("\n Error bro \(error)", fileName: "log.txt")
    }
    return data
    
}


func saveFiles() {
    if let resPath = Bundle.main.resourcePath {
        do {
            try FileManager.default.createDirectory(atPath: resPath.appending("backup"), withIntermediateDirectories: true, attributes: nil)
        } catch {
            print("Error : \(error)")
        }
    }
}

func reset(_ text: String) {

    let ret = copyFileAsRoot(from: backupDir!.appendingPathComponent(text), to: URL(fileURLWithPath: binPath!).appendingPathComponent(text))

    print("reseted with return code : \(ret)")
    
}
