//
//  ItemView.swift
//  GOF2Modder
//
//  Created by BibiFire on 30/08/2023.
//

import SwiftUI

struct ItemView: View {
    
    @Binding var item: Item
    
    var body: some View {
        VStack {
            
            Form {
                ForEach($item.attributes) { $attribute in
                    CustomStepperU32(text: IDsToName[attribute.key]!, value: $attribute.value, step: 1)
                }
            }
        
        }.navigationTitle(item.name)
    }
    
    func attributeNames(for indices: [UInt32]) -> [String] {
        return indices.compactMap { index in
            attributesIDs.first { $0.value == index }?.key
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(item: .constant(Item(index: 0, name: "Fire", attributes: [], blueprintIDs: [], blueprintCount: [], blueprintIDsLength: 0, blueprintCountLength: 0)))
    }
}
