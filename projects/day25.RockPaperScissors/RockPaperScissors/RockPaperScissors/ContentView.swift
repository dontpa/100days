//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by mrw on 2024/9/21.
//

import SwiftUI

struct BackgroundSettings : View {
    var body: some View{
        RadialGradient(stops: [
            .init(color: Color(red:0.1, green: 0.2, blue:0.45), location:0.3),
            .init(color: Color(red:0.76, green:0.15, blue:0.26), location: 0.3),
        ], center:.top, startRadius: 200, endRadius: 400).ignoresSafeArea()
    }
}

struct ContentView: View {
    
    let choice = ["ROCK", "PAPER", "SCISSORS"]
    
    let winOrLose = ["WIN", "LOSE"]
    
    @State private var currentChoice = Int.random(in: 0...2)
    @State private var currentDirection = Int.random(in: 0...1)
    
    @State private var showingResult = false
    @State private var tipMessage = ""
    @State private var current = ""
    @State private var direction = ""
    @State private var resultTitle = ""
    
    @State private var score = 0
    @State private var questionCount = 0
    @State private var showingFinalScore = false
    
    var body: some View {
        ZStack {
            BackgroundSettings()
            VStack{
                Spacer()
                Text("Tap The Right Choice")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing:15) {
                    VStack {
                        Text(choice[currentChoice])
                        Text(winOrLose[currentDirection])
                    }
                    
                    ForEach(0..<3) { number in
                        Text(choice[number]).onTapGesture {
                            choiceTapped(number)
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .font(.title.bold())
                    .foregroundStyle(.white)
                Text("Question: \(questionCount)/10")
                Spacer()
            }
            .padding()
        }
        .alert(resultTitle, isPresented: $showingResult) {
            Button("Continue", action: nextChoice)
        } message: {
            Text(tipMessage)
        }
        .alert("Game Over", isPresented: $showingFinalScore) {
            Button("Restart", action:restartGame)
        } message: {
            Text("Your final score is \(score) out of 10")
        }
    }
    
    func choiceTapped(_ number : Int){
        
        if choice[currentChoice] == "ROCK"
            && winOrLose[currentDirection] == "WIN"             {
            if choice[number] == "PAPER" {
                resultTitle = "Correct"
                score += 1
            } else {
                resultTitle = "Wrong"
                tipMessage = "The correct answer is PAPER"
            }
        }
        if choice[currentChoice] == "ROCK"
            && winOrLose[currentDirection] == "LOSE"             {
            if choice[number] == "SCISSORS" {
                resultTitle = "Correct"
                score += 1
            } else {
                resultTitle = "Wrong"
                tipMessage = "The correct answer is SCISSORS"
            }
            
        }
        
        if choice[currentChoice] == "PAPER"
            && winOrLose[currentDirection] == "WIN"             {
            if choice[number] == "SCISSORS" {
                resultTitle = "Correct"
                score += 1
            } else {
                resultTitle = "Wrong"
                tipMessage = "The correct answer is SCISSORS"
            }
        }
        if choice[currentChoice] == "PAPER"
            && winOrLose[currentDirection] == "LOSE"            {
            if choice[number] == "ROCK" {
                resultTitle = "Correct"
                score += 1
            } else {
                resultTitle = "Wrong"
                tipMessage = "The correct answer is ROCK"
            }
        }
        
        if choice[currentChoice] == "SCISSORS"
            && winOrLose[currentDirection] == "WIN" {
            if choice[number] == "ROCK" {
                resultTitle = "Correct"
                score += 1
            } else {
                resultTitle = "Wrong"
                tipMessage = "The correct answer is ROCK"
            }
            
        }
        if choice[currentChoice] == "SCISSORS"
            && winOrLose[currentDirection] == "LOSE" {
            if choice[number] == "PAPER" {
                resultTitle = "Correct"
                score += 1
            } else {
                resultTitle = "Wrong"
                tipMessage = "The correct answer is PAPER"
            }
        }
        questionCount += 1
        if questionCount == 10 {
            showingFinalScore = true
        } else {
            showingResult = true
        }
        
        
    }
    
    func nextChoice(){
        currentChoice = Int.random(in: 0...2)
        currentDirection = Int.random(in: 0...1)
        
    }
    
    func restartGame(){
        score = 0
        questionCount = 0
        currentChoice = Int.random(in: 0...2)
        currentDirection = Int.random(in: 0...1)
    }
}

#Preview {
    ContentView()
}
