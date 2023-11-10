//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Busayo Ajide on 11/6/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playCount = 1
    @State private var score = 0
    @State private var showingScore = false
    @State private var gameOver = false
    
    let moves = ["Rock 🪨", "Paper 📃", "Scissors ✄"]
    
    @State private var appMove = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var messageText = ""
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(colors: [.yellow, .pink], startPoint: .top, endPoint: .bottom)
                
                VStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    Text("Score - \(score)")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    Spacer()
                    
                    Text("Computer move: \(moves[appMove])")
                        .font(.title.weight(.semibold))
                    
                    
                    if shouldWin {
                        Text("Play to win - Yes")
                            .padding()
                            .font(.title2.weight(.semibold))
                    } else {
                        Text("Play to win - No")
                            .padding()
                            .font(.title2.weight(.semibold))
                    }
                    
                    ForEach(moves, id:\.self) { move in
                        Button(move) {
                            tapped(move)
                        }
                        .font(.system(size: 20))
                        .alert("Score" + ": \(score)", isPresented: $showingScore){
                            Button("Continue", action: askQuestion)
                        } message: {
                            Text(messageText)
                        }
                        .alert("Game Over", isPresented: $gameOver){
                            Button("Play Again", action: restart)
                        } message: {
                            Text("Your Final Score is \(score)")
                        }
                        .padding()
                        .background(.ultraThinMaterial)
                        .foregroundStyle(.primary)
                        .clipShape(.capsule)
                    }
                    .padding(20)
                    
                    Spacer()
                    Spacer()
                }
                .navigationTitle("Rock-Paper-Scissors")
            }
            .ignoresSafeArea()
        }
        
    }
        
    
    func tapped(_ move:String) {
        let playerChoice = move
        let appChoice = moves[appMove]
            
        switch appChoice{
        case "Rock 🪨":
            if playerChoice == "Paper 📃"{
                score += 1
                messageText = "Correct! you get one point."
            } else {
                score -= 1
                messageText = "Uh oh, you lose a point."
            }
        case "Scissors ✄":
            if playerChoice == "Rock 🪨"{
                score += 1
                messageText = "Correct! you get one point."
            } else {
                score -= 1
                messageText = "Uh oh, you lose a point."
            }
        default:
            if playerChoice == "Scissors ✄"{
                score += 1
                messageText = "Correct! you get one point."
            } else {
                score -= 1
                messageText = "Uh oh, you lose a point."
            }
        }
            
        shouldWin.toggle()
        playCount += 1
        
        if playCount > 10 {
            gameOver = true
        }
            
        showingScore = true
            
    }
    
    func askQuestion() {
        appMove = Int.random(in: 0...2)
    }
    
    func restart() {
        score = 0
        playCount = 1
        askQuestion()
    }
               
}
//}
#Preview {
    ContentView()
}
