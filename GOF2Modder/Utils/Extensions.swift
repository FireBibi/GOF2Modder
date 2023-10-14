//
//  Extensions.swift
//  GOF2Modder
//
//  Created by BibiFire on 01/10/2023.
//

import Foundation
import SwiftUI

extension Binding {
    func optionalBinding<T>() -> Binding<T>? where T? == Value {
        if let wrappedValue = wrappedValue {
            return Binding<T>(
                get: { wrappedValue },
                set: { self.wrappedValue = $0 }
            )
        } else {
            return nil
        }
    }
}

extension Data {
    var bigEndianUInt32: UInt32 { withUnsafeBytes({$0.load(as: UInt32.self)}).byteSwapped }
    var bigEndianInt32: Int32 { withUnsafeBytes({$0.load(as: Int32.self)}).byteSwapped }
    
    var bigEndianUInt16: UInt16 { withUnsafeBytes({$0.load(as: UInt16.self)}).byteSwapped }
    var bigEndianInt16: Int16 { withUnsafeBytes({$0.load(as: Int16.self)}).byteSwapped }
    
    var bigEndianFloat32: Float32 { Float32(withUnsafeBytes({$0.load(as: Float32.self)}).bitPattern.bigEndian) }
}

extension Data {
    var littleEndianUInt32: UInt32 { withUnsafeBytes({$0.load(as: UInt32.self)}).littleEndian }
    var littleEndianInt32: Int32 { withUnsafeBytes({$0.load(as: Int32.self)}).littleEndian }
    
    var littleEndianUInt16: UInt16 { withUnsafeBytes({$0.load(as: UInt16.self)}).littleEndian }
    var littleEndianInt16: Int16 { withUnsafeBytes({$0.load(as: Int16.self)}).littleEndian }
    
    var littleEndianFloat32: Float32 { Float32(withUnsafeBytes({$0.load(as: Float32.self)}).bitPattern.littleEndian) }
}
