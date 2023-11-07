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
    
    let moves = ["Rock", "Paper", "Scissors"]
    
    @State private var appMove = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var messageText = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Score: \(score)")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                Text("Computer move: \(moves[appMove])")
                    .font(.system(size: 25))
                    .bold()
                
                
                if shouldWin {
                    Text("Win : Yes")
                        .padding()
                        .font(.title2)
                        .bold()
                } else {
                    Text("Win: No")
                        .padding()
                        .font(.title2)
                        .bold()
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
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
                }
                .padding()
                    
                }
                .navigationTitle("Rock-Paper-Scissors")
            }
        }
        
        func tapped(_ move:String) {
            let playerChoice = move
            let appChoice = moves[appMove]
            
            switch appChoice{
            case "Rock":
                if playerChoice == "Paper"{
                    score += 1
                    messageText = "Correct! you get one point."
                } else {
                    score -= 1
                    messageText = "Uh oh, you lose a point."
                }
            case "Scissors":
                if playerChoice == "Rock"{
                    score += 1
                    messageText = "Correct! you get one point."
                } else {
                    score -= 1
                    messageText = "Uh oh, you lose a point."
                }
            default:
                if playerChoice == "Scissors"{
                    score += 1
                    messageText = "Correct! you get one point."
                } else {
                    score -= 1
                    messageText = "Uh oh, you lose a point."
                }
            }
            
            shouldWin.toggle()
            playCount += 1
            //appMove = Int.random(in: 0...2)
            
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
