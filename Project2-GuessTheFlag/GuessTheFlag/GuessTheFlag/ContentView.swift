//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Busayo Ajide on 11/4/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var restartGame = false
    @State private var scoreTitle = ""
    @State private var userScore = 0
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var count = 0
    @State private var messageText = ""
    
    var body: some View {
        
        ZStack {
            
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                
                Spacer()
                Spacer()
                
                Text("Score: \(userScore)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                            //.foregroundStyle(.white)
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .FlagStyle() 
                                //.modifier(FlagImage())
                                //.clipShape(.capsule)
                                //.shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                .alert(scoreTitle, isPresented: $showingScore) {
                    Button("Continue", action: askQuestion)
                } message: {
                    Text(messageText)
                }
                .alert("Game Over", isPresented: $restartGame){
                    Button("Restart", action: restart)
                } message: {
                    Text("Your Final Score is \(userScore)")
                }
                
            }
            .padding()
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore += 1 //Challenge 1 solution
            messageText = "Your Score is \(userScore)"
        } else {
            scoreTitle = "Wrong, that is the flag for \(countries[number])" //Challenge 2 solution
        }

        showingScore = true
    }
    
    func askQuestion() {
        count += 1
        if count < 8 {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        }
        if count == 8{
            restartGame = true
        }
    }
    
    
    func restart() {
        userScore = 0
        count = 0
        askQuestion()
        }
    }


// Prject 3 technical challenge additions
struct FlagImage: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

extension View {
    func FlagStyle() -> some View {
        modifier(FlagImage())
    }
}

#Preview {
    ContentView()
}
