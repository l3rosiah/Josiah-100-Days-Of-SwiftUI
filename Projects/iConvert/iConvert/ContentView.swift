//
//  ContentView.swift
//  iConvert
//
//  Created by Grace Filippi on 11/1/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputUnit = "Seconds"
    @State private var outputUnit = "Hours"
    @State private var inputValue: Double = 150
    @FocusState private var isFocused: Bool
    
    let timeIncrements = ["Seconds", "Minutes", "Hours", "Days"]
    
    var outputValue: Double {
        switch inputUnit {
        case "Seconds":
            if outputUnit == "Minutes" {
                return inputValue / 60
            } else if outputUnit == "Hours" {
                return inputValue / 60 / 60
            } else if outputUnit == "Days" {
                return inputValue / 60 / 60 / 24
            } else {
                return inputValue
            }
        case "Minutes":
            if outputUnit == "Seconds" {
                return inputValue * 60
            } else if outputUnit == "Hours" {
                return inputValue / 60
            } else if outputUnit == "Days" {
                return inputValue / 60 / 24
            } else {
                return inputValue
            }
        case "Hours":
            if outputUnit == "Seconds" {
                return inputValue * 60 * 60
            } else if outputUnit == "Minutes" {
                return inputValue * 60
            } else if outputUnit == "Days" {
                return inputValue / 24
            } else {
                return inputValue
            }
        case "Days":
            if outputUnit == "Seconds" {
                return inputValue * 24 * 60 * 60
            } else if outputUnit == "Minutes" {
                return inputValue * 24 * 60
            } else if outputUnit == "Hours" {
                return inputValue * 24
            } else {
                return inputValue
            }
        default:
            return 0
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input Amount and Interval") {
                    TextField("Amount", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                    Picker("Input value", selection: $inputUnit) {
                        ForEach(timeIncrements, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Output Amount and Time Interval:") {
                    Picker("Output value", selection: $outputUnit) {
                        ForEach(timeIncrements, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text(outputValue, format: .number)
                }
            } // form
            .navigationTitle("iConvert")
            .toolbar {
                if isFocused {
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
        } // navigationstack
        
        
    } // body
} // contentview

#Preview {
    ContentView()
}
