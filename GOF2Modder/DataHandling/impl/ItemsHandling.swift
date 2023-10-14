//
//  ItemsHandling.swift
//  GOF2Modder
//
//  Created by BibiFire on 29/08/2023.
//

import Foundation

func parseItems() -> [Item] {
    
    var items: [Item] = []
    let endianness: Endianness = Endianness.BIG
    do {
        
        let inputURL: URL = URL(fileURLWithPath: binPath!).appendingPathComponent("items.bin")
        
        if let file = try? FileHandle(forReadingFrom: inputURL) {
            
            var bitsRead: Int = 0
            	
            while (bitsRead)<(try FileManager.default.attributesOfItem(atPath: inputURL.path)[.size] as! Int){
            
                
                let blueprintIDsLength: UInt32 = try readU32(data: try file.read(upToCount: 4)!, endianness: endianness)
                let blueprintItemsID: [UInt32] = try getBlueprintArray(file: file, iterationCount: blueprintIDsLength, endianness: endianness, pointer: &bitsRead)
                let blueprintCountLength: UInt32 = try readU32(data: try file.read(upToCount: 4)!, endianness: endianness)
                let blueprintItemsCount: [UInt32] = try getBlueprintArray(file: file, iterationCount: blueprintCountLength, endianness: endianness, pointer: &bitsRead)
                let attributes: [ItemAttribute] = try readAttributes(file: file, endianness: endianness, pointer: &bitsRead)
                
                
                bitsRead += 8
                
                items.append(Item(
                    index: attributes[0].value,
                    name: itemNames[Int(attributes[0].value)],
                    attributes: attributes,
                    blueprintIDs: blueprintItemsID,
                    blueprintCount: blueprintItemsCount,
                    blueprintIDsLength: blueprintIDsLength,
                    blueprintCountLength: blueprintCountLength))
            }
        }
    } catch {
        writeStringToLogFile("Error : \(error)", fileName: "log.txt")
    }
    return items
}

func getBlueprintArray(file: FileHandle, iterationCount: UInt32, endianness: Endianness, pointer: UnsafeMutablePointer<Int>)-> [UInt32] {
    var itemIDs: [UInt32] = []
    do {
        
        var i: Int = 0
        
        while i < iterationCount {
            itemIDs.append(readU32(data: try file.read(upToCount: 4)!, endianness: endianness))
            pointer.pointee += 4
            i+=1
        }
        
    } catch {
        print("Error \(error)")
    }
    
    return itemIDs
}

func readAttributes(file: FileHandle, endianness: Endianness, pointer: UnsafeMutablePointer<Int>) -> [ItemAttribute] {
    var data: [ItemAttribute] = []
    
    do {
        let attributeSize: UInt32 = readU32(data: try file.read(upToCount: 4)!, endianness: endianness)
        
        if (attributeSize % 2 != 0) || (attributeSize == 0) {
            print("Invalid items.bin")
            return data
        }
        
        let attributes: [UInt32] = readU32s(data: try file.read(upToCount: Int(attributeSize)*4)!, endianness: endianness)
        
        pointer.pointee += (4 + Int(attributeSize)*4)
        
        var i: Int = 0
        while i < attributeSize {
            data.append(ItemAttribute(key: attributes[Int(i)], value: attributes[Int(i+1)]))
            i+=2
        }
        
        
        
    } catch {
        writeStringToLogFile("Error \(error)", fileName: "log.txt")
    }
    
    return data
}

func writeItems(items: [Item]) {
    var data: Data = Data()
    let endianness: Endianness = Endianness.BIG
    
    for item in items {
        data.append(writeU32(u32: item.blueprintIDsLength, endianness: endianness))
        data.append(writeU32s(u32s: item.blueprintIDs, endianness: endianness))
        data.append(writeU32(u32: item.blueprintCountLength, endianness: endianness))
        data.append(writeU32s(u32s: item.blueprintCount, endianness: endianness))
        data.append(writeU32s(u32s: item.attributes.flatMap {[$0.key, $0.key]}, endianness: endianness))
    }
    
    do {
        let url = URL(fileURLWithPath: binPath!).appendingPathComponent("items.bin")
        
        let tempURL = tempPath!.appendingPathComponent("items.bin")
        createTempBinFile(data: data, file: tempURL)
        
        copyFileAsRoot(from: tempURL, to: url)
        
    } catch {writeStringToLogFile("Error : \(error)", fileName: "log.txt")}
}

