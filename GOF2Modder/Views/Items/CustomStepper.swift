//
//  CustomStepper.swift
//  GOF2Modder
//
//  Created by BibiFire on 30/08/2023.
//

import SwiftUI

struct CustomStepperU32: View {
    
    public var text: String
    @Binding public var value: UInt32
    
    public var step: UInt32
    
    func incrementStep() {
        value += step
    }


    func decrementStep() {
        if value != 0 {
            value -= step
        }
        
    }
    
    var body: some View {
        HStack {
            Stepper {
                Text("\(text) : \(value)")
                //TextField("", value: $value, formatter: NumberFormatter())
                //    .keyboardType(.numberPad)
                    /*.introspect(.textField, on: .iOS(.v14)) { textfield in
                      textfield.returnKeyType = .done
                    }*/
                    
                    }
                    onIncrement: {
                        incrementStep()
                    } onDecrement: {
                        decrementStep()
                    }
                    .padding(5)
        }

    }
}

struct CustomStepperI16: View {
    
    public var text: String
    @Binding public var value: Int16
    
    public var step: Int16
    
    func incrementStep() {
        value += step
    }


    func decrementStep() {
        value -= step
    }
    
    var body: some View {
        HStack {
            Stepper {
                Text("\(text) : \(value)")
                //TextField("", value: $value, formatter: NumberFormatter())
                //    .keyboardType(.numberPad)
                    /*.introspect(.textField, on: .iOS(.v14)) { textfield in
                      textfield.returnKeyType = .done
                    }*/
                    
                    } onIncrement: {
                        incrementStep()
                    } onDecrement: {
                        decrementStep()
                    }
                    .padding(5)
        }

    }
}

struct CustomStepperU16: View {
    
    public var text: String
    @Binding public var value: UInt16
    
    public var step: UInt16
    
    func incrementStep() {
        value += step
    }


    func decrementStep() {
        if value != 0 {
            value -= step
        }
    }
    
    var body: some View {
        HStack {
            Stepper {
                Text("\(text) : \(value)")
                //TextField("", value: $value, formatter: NumberFormatter())
                //    .keyboardType(.numberPad)
                    /*.introspect(.textField, on: .iOS(.v14)) { textfield in
                      textfield.returnKeyType = .done
                    }*/
                    
                    } onIncrement: {
                        incrementStep()
                    } onDecrement: {
                        decrementStep()
                    }
                    .padding(5)
        }

    }
}

struct CustomStepperF32: View {
    
    public var text: String
    @Binding public var value: Float32
    
    public var step: Float32
    
    func incrementStep() {
        value += step
    }


    func decrementStep() {
        value -= step
    }
    
    var body: some View {
        HStack {
            Stepper {
                Text("\(text) : \(value)")
                //TextField("", value: $value, formatter: NumberFormatter())
                //    .keyboardType(.numberPad)
                    /*.introspect(.textField, on: .iOS(.v14)) { textfield in
                      textfield.returnKeyType = .done
                    }*/
                    
                    } onIncrement: {
                        incrementStep()
                    } onDecrement: {
                        decrementStep()
                    }
                    .padding(5)
        }

    }
}
