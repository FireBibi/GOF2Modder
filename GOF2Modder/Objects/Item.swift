//
//  Item.swift
//  GOF2Modder
//
//  Created by BibiFire on 30/08/2023.
//

import Foundation

struct Item: Identifiable {
    var id: String {
        self.name
    }
    
    var index: UInt32
    var name: String
    var attributes: [ItemAttribute]
    var blueprintIDs: [UInt32]
    var blueprintCount: [UInt32]
    var blueprintIDsLength: UInt32
    var blueprintCountLength: UInt32
}

struct ItemAttribute: Identifiable {
    var id: UInt32 {
        self.key
    }
    
    var key: UInt32
    var value: UInt32
}

let attributesIDs: [String: UInt32] = [
    "Index": 0,
    "Type": 1,
    "Sort": 2,
    "Tech Level": 3,
    "Minimum price system ID": 4,
    "Maximum price system ID": 5,
    "Occurence": 6,
    "Minimum Price": 7,
    "Maximum Price": 8,
    "Damage": 9,
    "EMP Damage": 10,
    "Loading Speed": 11,
    "Shot lifetime ms": 12,
    "Speed Factor": 13,
    "Magnitude": 14,
    "Steerable": 15,
    "Automatic": 16,
    "Handling": 17,
    "Capacity": 18,
    "Loading Speed": 19,
    "Armour": 20,
    "Effect": 21,
    "Automatic": 22,
    "Lock Time": 23,
    "Effect": 25,
    "Loading Speed": 26,
    "Duration": 27,
    "Effect": 28,
    "Lock time": 29,
    "Show Class A asteroids": 30,
    "Show cargo": 31,
    "Handling": 32,
    "Yield": 33,
    "Size": 34,
    "Effect": 35,
    "Loading speed": 36,
    "Loading speed": 37,
    "Energy comsuption": 38,
    "Fire rate": 39,
    "Damage": 40,
    "Effect": 41,
    "Effect": 42,
    "Loading speed": 43,
    "Magnitude": 50,
    "Capacity": 52,
    "Range": 53,
    "Effect": 54,
    "Count": 55,
    "Effect": 56,
    "Show info": 57,
    "Show on radar": 58,
    "Comsuption": 59,
    "Vossk item": 60,
    "????": 61
]

let IDsToName: [UInt32 : String] = [
    0: "Index",
    1: "Type",
    2: "Sort",
    3: "Tech Level",
    4: "Minimum price system ID",
    5: "Maximum price system ID",
    6: "Occurrence",
    7: "Minimum Price",
    8: "Maximum Price",
    9: "Damage",
    10: "EMP Damage",
    11: "Loading Speed",
    12: "Shot lifetime ms",
    13: "Speed Factor",
    14: "Magnitude",
    15: "Steerable",
    16: "Automatic",
    17: "Handling",
    18: "Capacity",
    19: "Loading Speed",
    20: "Armour",
    21: "Effect",
    22: "Automatic",
    23: "Lock Time",
    25: "Effect",
    26: "Loading Speed",
    27: "Duration",
    28: "Effect",
    29: "Lock time",
    30: "Show Class A asteroids",
    31: "Show cargo",
    32: "Handling",
    33: "Yield",
    34: "Size",
    35: "Effect",
    36: "Loading speed",
    37: "Loading speed",
    38: "Energy consumption",
    39: "Fire rate",
    40: "Damage",
    41: "Effect",
    42: "Effect",
    43: "Loading speed",
    50: "Magnitude",
    52: "Capacity",
    53: "Range",
    54: "Effect",
    55: "Count",
    56: "Effect",
    57: "Show info",
    58: "Show on radar",
    59: "Consumption",
    60: "Vossk item",
    61: "????"
]

