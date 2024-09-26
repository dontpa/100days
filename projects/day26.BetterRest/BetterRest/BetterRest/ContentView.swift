//
//  ContentView.swift
//  BetterRest
//
//  Created by mrw on 2024/9/24.
//

import CoreML
import SwiftUI

struct ContentView: View {

    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
//
//    @State private var alertTitle = ""
//    @State private var alertMessage = ""
//    @State private var showAlert = false
//
    @State private var predictedTime = "..."

    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }

    var body: some View {
        NavigationStack {
            Form {
                VStack(alignment: .leading, spacing: 0) {
                    Text("When do you want to wake up?")
                        .font(.headline)

                    DatePicker(
                        "Please enter a time", selection: $wakeUp,
                        displayedComponents: .hourAndMinute
                    )
                    .onChange(of: wakeUp) {_ in calculateBedtime()}
                    .labelsHidden()
                }

                VStack(alignment: .leading, spacing: 0) {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    Picker("Select hours of sleep", selection: $sleepAmount) {
                        ForEach(4...12, id: \.self) { hour in
                            Text(String(format: "%.2f hours", Double(hour)))
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .onChange(of: sleepAmount) {_ in calculateBedtime()}

                    //                    Stepper(
                    //                        "\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12,
                    //                        step: 0.25)

                }

                VStack(alignment: .leading, spacing: 0) {
                    Text("Daily coffee intake").font(.headline)

                    Picker("Select number of cups", selection: $coffeeAmount) {
                        ForEach(1...20, id: \.self) { cups in
                            Text("^[\(cups) cup](inflect: true)")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .onChange(of: coffeeAmount) {_ in calculateBedtime()}
                    
                    //                    Stepper(
                    //                        "^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)

                }
                
                VStack {
                    Text("Your ideal bedtime is")
                        .font(.title2)
                    Text("\(predictedTime)")
                        .font(.largeTitle)
                }

            }
            .navigationTitle("BetterRest")
//            .toolbar {
//                Button("Calculate", action: calculateBedtime)
//            }
//            .alert(alertTitle, isPresented: $showAlert) {
//                Button("OK") {}
//            } message: {
//                Text(alertMessage)
//            }

        }
    }

    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)

            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60

            let prediction = try model.prediction(
                wake: Double(hour + minute), estimatedSleep: sleepAmount,
                coffee: Double(coffeeAmount))

            let sleepTime = wakeUp - prediction.actualSleep

//            alertTitle = "Your ideal bedtime is..."
            predictedTime = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
//            alertTitle = "Error"
//            alertMessage = "Sorry, some problem occured."
            predictedTime = "Error calculating bedtime"
            print("Prediction error: \(error)")
        }

//        showAlert = true

    }

}

#Preview {
    ContentView()
}
