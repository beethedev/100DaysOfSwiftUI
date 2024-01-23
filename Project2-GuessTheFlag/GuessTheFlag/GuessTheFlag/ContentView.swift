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
    
    let labels = [
        "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
        "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
        "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
        "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
        "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
        "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
        "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
        "Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
        "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
    ]
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var count = 0
    @State private var messageText = ""
    
    @State private var animationAmount = 0.0
    @State private var tappedFlag = 0
    @State private var transperency = 1.0
    @State private var scaleAmount = 1.0
    
    
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
                            withAnimation{
                                animationAmount += 360
                                transperency = 0.25
                                scaleAmount = 0.7
                            }
                        } label: {
                            FlagImage(image: countries[number])
                            //Image(countries[number])
                            //.clipShape(.capsule)
                            //.shadow(radius: 5)
                        }
                        .scaleEffect(tappedFlag != number ? scaleAmount : 1)
                        .opacity(tappedFlag != number ? transperency : 1)
                        .rotation3DEffect(
                            .degrees(tappedFlag == number ? animationAmount : 0),
                            axis: (x: 0.0, y: 1.0, z: 0.0)
                        )
                        .accessibilityLabel(labels[countries[number], default: "Unknown flag"])
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
                    Button("Play Again", action: restart)
                } message: {
                    Text("Your Final Score is \(userScore)")
                }
            }
            .padding()
            
        }
    }
    
  
    
    func flagTapped(_ number: Int) {
        tappedFlag = number
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
        transperency = 1.0
        tappedFlag = 0
        scaleAmount = 1
    }
    
    
    func restart() {
        userScore = 0
        count = 0
        askQuestion()
        }
    }


// Prject 3 technical challenge additions using view composition

struct FlagImage: View {
    var image: String
    
    var body: some View {
        Image(image)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}


#Preview {
    ContentView()
}
