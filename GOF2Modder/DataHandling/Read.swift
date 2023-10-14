//
//  Read.swift
//  GOF2Modder
//
//  Created by BibiFire on 01/10/2023.
//

import Foundation


func readU16(data: Data, endianness: Endianness) -> UInt16 {
    return endianness == Endianness.BIG ? data.bigEndianUInt16 : data.littleEndianUInt16
}

func readI16(data: Data, endianness: Endianness) -> Int16 {
    return endianness == Endianness.BIG ? data.bigEndianInt16 : data.littleEndianInt16
}


func readU32(data: Data, endianness: Endianness) -> UInt32{
    return endianness == Endianness.BIG ? data.bigEndianUInt32 : data.littleEndianUInt32
}

func readU32s(data: Data, endianness: Endianness) -> [UInt32]{
    
    return data.withUnsafeBytes { pointer in
        pointer.bindMemory(to: UInt32.self).map(UInt32.init(bigEndian:))
    }
    
}

func readF32(data: Data, endianness: Endianness) -> Float32 {
    return endianness == Endianness.BIG ? data.bigEndianFloat32 : data.littleEndianFloat32
}

func readString(data: Data) -> String {
    return String(decoding: data, as: UTF8.self)
}
