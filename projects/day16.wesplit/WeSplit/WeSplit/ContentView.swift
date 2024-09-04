//
//  ContentView.swift
//  WeSplit
//
//  Created by mrw on 2024/9/3.
//

import SwiftUI

//struct ContentView: View {
//    @State private var name = ""
//    let students = ["Harry" ,"Hermione", "Ron"]
//    @State private var selectedStudent = "Harry"
//    
//    var body:some View{
//        NavigationStack{
//            Form{
//                Picker("Select your student", selection: $selectedStudent){
//                    ForEach(students,id:\.self){
//                        Text($0)
//                    }
//                    
//                }
//                Text("selected name =  \(selectedStudent)")
//                
//                ForEach(0..<100){
//                    Text("Row \($0)")
//                    
//                }
//                TextField("Enter your name", text: $name)
//                Text("your name is \(name)")
//            }
//        }
//    }
//}

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    var totalCheckAmount :Double {
        (checkAmount / 100 * Double(tipPercentage) + checkAmount)
    }
    var totalPerPerson: Double {
        totalCheckAmount / Double(numberOfPeople)
    }
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code:Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }
                Picker("Number of people,", selection: $numberOfPeople) {
                    ForEach(2..<100, id:\.self) {
                        Text("\($0) people")
                    }
                }
                .pickerStyle(.navigationLink)
                Section("How much tip do you want to leave?") {
                    
                    Picker("Tip percentage: ", selection: $tipPercentage){
                        ForEach(0...100,id:\.self){
                            Text("\($0)% tip percentage ")
                        }
                    } .pickerStyle(.navigationLink)
                }
                Section("Total amount for the check:") {
                    Text(totalCheckAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                Section("Amount per person"){
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }

               
            }
            .navigationTitle("WeSplit")
            .toolbar{
                if amountIsFocused{
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
        
    }
}


#Preview {
    ContentView()
}
