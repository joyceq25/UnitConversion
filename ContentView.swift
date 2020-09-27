//
//  ContentView.swift
//  UnitConversion
//
//  Created by Ping Yun on 9/26/20.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNum = ""
    @State private var inputUnit = 2 //index in unitChoices
    @State private var outputUnit = 2 //index in unitChoices
    let unitChoices = ["seconds", "minutes", "hours", "days"] //possible units of time 
    
    var result: Double {
        let inputAmount = Double(inputNum) ?? 0 //converts inputNum to Double
        let inputUnits = unitChoices[inputUnit] //gets value of unitChoices at inputUnit
        let outputUnits = unitChoices[outputUnit] //gets value of unitChoices at outputUnit
        
        //converts inputUnits to seconds
        var inSeconds = 0.0
        if inputUnits == "seconds" {
            inSeconds = inputAmount
        }
        else if inputUnits == "minutes" {
            inSeconds = inputAmount * 60.0
        }
        else if inputUnits == "hours" {
            inSeconds = inputAmount * 60.0 * 60.0
        }
        else {
            inSeconds = inputAmount * 60.0 * 60.0 * 24.0
        }
        
        //converts inSeconds to outputUnits
        if outputUnits == "seconds" {
            return inSeconds
        }
        else if outputUnits == "minutes" {
            return inSeconds/60.0
        }
        else if outputUnits == "hours" {
            return inSeconds/60.0/60.0
        }
        else {
            return inSeconds/60.0/60.0/24.0
        }
    }
    
    var body: some View {
        NavigationView{
            Form {
                //where user enters starting amount
                Section(header: Text("Starting amount")) {
                    TextField("Amount", text: $inputNum)
                        .keyboardType(.decimalPad)
                }
                
                //segmented control for input units
                Section(header: Text("Input units")) {
                    Picker("Input units", selection: $inputUnit) {
                        ForEach(0 ..< unitChoices.count) {
                            Text("\(self.unitChoices[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                //segmented control for output units
                Section(header: Text("Output units")) {
                    Picker("Output units", selection: $outputUnit) {
                        ForEach(0 ..< unitChoices.count) {
                            Text("\(self.unitChoices[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                //where result is shown
                Section(header: Text("Result")) {
                    Text("\(result, specifier: "%.2f")")
                }
            }
        //title for navigation bar
        .navigationBarTitle("Time Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
