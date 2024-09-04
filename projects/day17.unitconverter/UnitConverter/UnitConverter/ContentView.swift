//
//  ContentView.swift
//  UnitConverter
//
//  Created by mrw on 2024/9/4.
//



import SwiftUI

struct ContentView: View {
    enum Unit: String, CaseIterable{
        case Celsius = "Celsius(°C)"
        case Fahrenheit = "Fahrenheit(°F)"
        case Kelvin = "Kelvin(K)"
    }
    @State private var sourceUnit = Unit.Fahrenheit
    @State private var targetUnit = Unit.Celsius
    @State private var source = 0.0
    @FocusState private var inputIsFocused : Bool
    
    var result : Double {
        switch (sourceUnit, targetUnit) {
        case (.Celsius, .Fahrenheit):
            celsiusToFahrenheit(source: source)
        case (.Celsius, .Kelvin):
            celsiusToKelvin(source: source)
        case (.Fahrenheit, .Celsius):
            fahrenheitToCelsius(source: source)
        case (.Fahrenheit, .Kelvin):
            celsiusToKelvin(source: fahrenheitToCelsius(source: source))
        case (.Kelvin, .Celsius):
            kelvinToCelsius(source: source)
        case (.Kelvin, .Fahrenheit):
            celsiusToFahrenheit(source: kelvinToCelsius(source: source))
        default:
            source
        }
    }
    
    func celsiusToFahrenheit(source : Double ) -> Double {
        return source * 9 / 5 + 32
    }
    
    func celsiusToKelvin(source : Double) -> Double {
        return source + 273.15
    }
    
    func fahrenheitToCelsius(source : Double) -> Double {
        (source - 32) * 5 / 9
    }
    
    func kelvinToCelsius(source : Double) -> Double {
        source - 273.15
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Source Unit") {
                    Picker("Source Unit", selection: $sourceUnit) {
                        ForEach(Unit.allCases, id:\.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section {
                    TextField("Enter value", value: $source, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                    
                }
                Section("Target Unit") {
                    Picker("Target Unit", selection: $targetUnit) {
                        ForEach(Unit.allCases, id:\.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section {
                    Text("result : \(result, specifier: "%.2f")")
                }
            }
            .toolbar{
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
