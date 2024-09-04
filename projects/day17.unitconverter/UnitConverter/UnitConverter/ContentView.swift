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
    var result : Double {
        if sourceUnit == targetUnit {
            return source
        }
        if sourceUnit == .Celsius && targetUnit == .Fahrenheit {
            return celsiusToFahrenheit(source: source)
        }
        if sourceUnit == .Celsius && targetUnit == .Kelvin {
            return celsiusToKelvin(source: source)
        }
        if sourceUnit == .Fahrenheit && targetUnit == .Celsius {
            return fahrenheitToCelsius(source: source)
        }
        if sourceUnit == .Fahrenheit && targetUnit == .Kelvin {
            return celsiusToKelvin(source: fahrenheitToCelsius(source: source))
        }
        if sourceUnit == .Kelvin && targetUnit == .Celsius {
            return kelvinToCelsius(source: source)
        }
        if sourceUnit == .Kelvin && targetUnit == .Fahrenheit {
            return celsiusToFahrenheit(source: kelvinToCelsius(source: source))
        }
        fatalError("Unsupported unit conversion")
    }
    
    @FocusState private var inputIsFocused : Bool
    
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
                Section {
                    Picker("Source Unit", selection: $sourceUnit) {
                        ForEach(Unit.allCases, id:\.self) {
                            Text($0.rawValue)
                        }
                    }
                }
                Section {
                    TextField("input", value: $source, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                    
                }
                Section {
                    Picker("Target Unit", selection: $targetUnit) {
                        ForEach(Unit.allCases, id:\.self) {
                            Text($0.rawValue)
                        }
                    }
                }
                Section {
                    Text("result : \(result)")
                }
            }
            .toolbar{
                if inputIsFocused {
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
