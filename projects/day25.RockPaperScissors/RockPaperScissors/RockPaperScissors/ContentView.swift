//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by mrw on 2024/9/21.
//

import SwiftUI

enum Choice: String, CaseIterable {
    case rock = "ROCK"
    case paper = "PAPER"
    case scissors = "SCISSORS"
    
    func beats(_ other: Choice) -> Bool {
        switch (self, other) {
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            return true
        default:
            return false
        }
    }
}

enum GameMode: String, CaseIterable {
    case win = "WIN"
    case lose = "LOSE"
}

struct GameState {
    var currentChoice: Choice
    var currentMode: GameMode
    var score: Int
    var questionCount: Int
    
    mutating func nextRound(){
        currentChoice = Choice.allCases.randomElement()!
        currentMode = GameMode.allCases.randomElement()!
        questionCount += 1
    }
    
    mutating func reset() {
        score = 0
        questionCount = 0
        nextRound()
    }
}

struct BackgroundGradient : View {
    var body: some View{
        RadialGradient(
            gradient: Gradient(colors: [
                Color(red:0.1, green: 0.2, blue: 0.45),
                Color(red:0.76, green: 0.15, blue: 0.26)
            ]),
            center:.top,
            startRadius: 200,
            endRadius: 400)
        .ignoresSafeArea()
    }
}

struct ChoiceButton: View {
    let choice: Choice
    let action:() -> Void
    
    var body: some View {
        Button(action: action) {
            Text(choice.rawValue)
                .font(.title2)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white.opacity(0.2))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

struct GameView: View {
    @Binding var gameState: GameState
    @Binding var showingResult: Bool
    @Binding var resultTitle: String
    @Binding var tipMessage: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Tap The Right Choice")
                .font(.largeTitle.bold())
                .foregroundStyle(.white)
            
            VStack {
                Text(gameState.currentChoice.rawValue)
                    .font(.title)
                Text(gameState.currentMode.rawValue)
                    .font(.headline)
            }
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            ForEach(Choice.allCases, id: \.self) { choice in
                ChoiceButton(choice: choice) {
                    choiceTapped(choice)
                }
            }
            Spacer()
            
            VStack {
                Text("Score: \(gameState.score)")
                Text("Question: \(gameState.questionCount)/10")
            }
            .font(.title2)
            .foregroundColor(.white)
        }
        .padding()
    }
    
    private func choiceTapped(_ choice: Choice) {
        let isCorrectChoice: Bool
        switch gameState.currentMode {
        case .win:
            isCorrectChoice = choice.beats(gameState.currentChoice)
        case .lose:
            isCorrectChoice = gameState.currentChoice.beats(choice)
        }
        
        if isCorrectChoice {
            resultTitle = "Correct"
            gameState.score += 1
            tipMessage = ""
        } else {
            resultTitle = "Wrong"
            tipMessage = "The correct answer is \(getCorrectAnswer())"
        }
        
        if gameState.questionCount == 9 {
            showingResult = false
            gameState.questionCount += 1
        } else {
            showingResult = true
            gameState.nextRound()
        }
    }
    
    private func getCorrectAnswer() -> String {
        switch gameState.currentMode {
        case .win:
            return Choice.allCases.first {$0.beats(gameState.currentChoice)}!.rawValue
        case .lose:
            return Choice.allCases.first {gameState.currentChoice.beats($0)}!.rawValue
        }
    }
}

struct ContentView: View {
    
    @State private var gameState = GameState(currentChoice: .rock, currentMode: .win, score: 0, questionCount: 0)
    @State private var showingResult = false
    @State private var showingFinalScore = false
    @State private var resultTitle = ""
    @State private var tipMessage = ""
    
    var body: some View {
        ZStack {
            BackgroundGradient()
            
            GameView(gameState: $gameState, showingResult: $showingResult, resultTitle: $resultTitle, tipMessage: $tipMessage)
        }
        .alert(resultTitle, isPresented: $showingResult) {
            Button("Continue", action: {})
        } message: {
            Text(tipMessage)
        }
        .alert("Game Over", isPresented: .constant(gameState.questionCount == 10)) {
            Button("Restart", action: {gameState.reset()})
        } message: {
            Text("Your final score is \(gameState.score) out of 10")
        }
    }
}

#Preview {
    ContentView()
}
