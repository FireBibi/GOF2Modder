//
//  WeaponEditingView.swift
//  GOF2Modder
//
//  Created by BibiFire on 01/10/2023.
//

import SwiftUI

struct WeaponEditingView: View {
    @Binding var weaponSettings: Weapon
    
    var body: some View {
        Form {
            CustomStepperI16(text: "x", value: $weaponSettings.x, step: 1)
            CustomStepperI16(text: "y", value: $weaponSettings.y, step: 1)
            CustomStepperI16(text: "z", value: $weaponSettings.z, step: 1)
            
            if let $engineSettings = $weaponSettings.engineSettings.optionalBinding() {
                
                CustomStepperF32(text: "Intensity", value: $engineSettings.intensity, step: 1)
                CustomStepperF32(text: "Whatever", value: $engineSettings.whatever, step: 1)
                CustomStepperF32(text: "WhateverV2", value: $engineSettings.whatever2, step: 1)
            }
        }
        
        
    }
}

struct WeaponEditingView_Previews: PreviewProvider {
    static var previews: some View {
        WeaponEditingView(weaponSettings: .constant(Weapon(type: 0, x: 0, y: 0, z: 0)))
    }
}
