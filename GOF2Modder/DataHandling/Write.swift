//
//  Write.swift
//  GOF2Modder
//
//  Created by BibiFire on 01/10/2023.
//

import Foundation

func writeU16(u16: UInt16, endianness: Endianness) -> Data {
    var value = (endianness == Endianness.BIG ? u16.bigEndian : u16.littleEndian)
        return Data(bytes: &value, count: MemoryLayout.size(ofValue: value))
}

func writeI16(i16: Int16, endianness: Endianness) -> Data {
    var value = (endianness == Endianness.BIG ? i16.bigEndian : i16.littleEndian)
    return Data(bytes: &value, count: MemoryLayout.size(ofValue: value))
}

func writeU32(u32: UInt32, endianness: Endianness) -> Data {
    var value = (endianness == Endianness.BIG ? u32.bigEndian : u32.littleEndian)
        return Data(bytes: &value, count: MemoryLayout.size(ofValue: value))
}

func writeU32s(u32s: [UInt32], endianness: Endianness) -> Data{
    var data = Data()
    for value in u32s {
        var value = (endianness == Endianness.BIG ? value.bigEndian : value.littleEndian)
        data.append(Data(bytes: &value, count: MemoryLayout.size(ofValue: value)))
    }
                    
    return data
}

func writeF32(f32: Float32, endianness: Endianness) -> Data {
    var value = (endianness == Endianness.BIG ? f32.bitPattern.bigEndian : f32.bitPattern.littleEndian)
        return Data(bytes: &value, count: MemoryLayout.size(ofValue: value))
}

func writeString(string: String) -> Data {
    return string.data(using: .utf8)!
}
