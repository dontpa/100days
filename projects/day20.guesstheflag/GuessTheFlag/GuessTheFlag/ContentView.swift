//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by mrw on 2024/9/9.
//


//        ZStack{
//            VStack(spacing:0){
//                Color.red
//                Color.blue
//            }
//
//            Text("Your context")
//                .foregroundStyle(.secondary)
//                .padding(50)
//                .background(.ultraThinMaterial)
//        }
//        .ignoresSafeArea()

//        LinearGradient(colors:[.yellow,.brown],startPoint: .top,endPoint: .bottom).ignoresSafeArea()
//        RadialGradient(colors: [.blue,.black], center: .center, startRadius: 20, endRadius: 200)
//        AngularGradient(colors: [.red,.yellow,.green,.blue,.purple,.red], center: .center)
//        Text("YourContent").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
//            .foregroundStyle(.white)
//            .background(.indigo.gradient)
//        Button("Delete selection", role:.destructive ,action:executeDelete)

//        VStack{
//            Button("Button 1"){}.buttonStyle(.bordered)
//            Button("Button 2", role: .destructive){}.buttonStyle(.bordered)
//            Button("Button 3"){}.buttonStyle(.borderedProminent)
//                .tint(.indigo)
//            Button("Button 4", role: .destructive){}.buttonStyle(.borderedProminent)
//        }

import SwiftUI

//struct ContentView: View {
//    @State private var showingAlert = false
//
//    var body: some View {
//        VStack{
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//        Button("Show alert"){
//            showingAlert = true
//        }
//        .alert("Important message", isPresented: $showingAlert){
//            Button("Delete", role:.destructive){}
//            Button("Cancel", role: .cancel) {}
//        } message: {
//            Text("Please read this")
//        }
//    }
//
//    func executeDelete(){
//        print("Now deleting")
//    }
//}

struct FlagImage: View {
    var text:String
    
    var body: some View {
        Image(text).clipShape(.capsule).shadow(radius: 5)
    }
}

struct BluedLargeTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title.bold())
            .foregroundStyle(.blue)
    }
}

struct ContentView: View{
    
    @State private var countries = ["Estonia","France","Germany","Ireland","Italy", "Nigeria", "Poland", "Spain","UK","Ukraine","US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var tipMessage = ""
    @State private var questionCount = 0
    @State private var showingFinalScore = false
    
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400).ignoresSafeArea()
            VStack{
                Spacer()
                
                Text("Guess The Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                VStack(spacing: 15){
                    
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundStyle(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3){ number in
                        Button {
                            // tap action
                            flagTapped(number)
                        } label:{
                            FlagImage(text: countries[number])
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)" )
                    .modifier(BluedLargeTitle())
                Text("Question: \(questionCount)/8")
                    .foregroundStyle(.white)
                    .font(.title3)
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text(tipMessage)
        }
        .alert("Game Over", isPresented: $showingFinalScore) {
            Button("Restart", action: restartGame)
        } message: {
            Text("Your final score is \(score) out of 8.")
        }
    }
    
    func flagTapped(_ number: Int){
        if number == correctAnswer {
            score += 1
            scoreTitle = "Correct"
            tipMessage = "Your score is \(score)"
        } else {
            scoreTitle = "Wrong"
            tipMessage = "Wrong, That's the flag of \(countries[number])"
        }
        questionCount += 1
        if questionCount == 8 {
            showingFinalScore = true
        } else {
            showingScore = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func restartGame() {
        score = 0
        questionCount = 0
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
