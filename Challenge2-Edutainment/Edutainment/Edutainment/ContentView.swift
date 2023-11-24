//
//  ContentView.swift
//  Edutainment
//
//  Created by Busayo Ajide on 11/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var noToMultiply = 3
    @State private var question = 5
    @State private var answer = 0
    @State private var score = 0
    
    @State private var correctAnswer = 0
    @State private var number = Int.random(in:0..<15)
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingScore = false
    
    @State private var count = 0
    @State private var restartGame = false
    @State private var icons = ["bear", "buffalo", "chick", "chicken", "cow", "crocodile", "dog", "duck", "elephant", "frog", "giraffe", "goat","gorilla", "hippo", "horse", "monkey", "moose"].shuffled()
    
    @State private var animateIcon = false
    @State private var animationAmount = 0.0
    
    let questions = [5, 10, 20]
    //static let multipliers = 2...30
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                LinearGradient(colors: [.yellow, .pink], startPoint: .top, endPoint:.bottom)
                    .ignoresSafeArea()
                
                VStack{
                    
                    VStack{
                        Text("Score - \(score)").font(.title)
                            .bold()
                        
                        Spacer()

                        Text("Choose a times table between 2 and 12")
                            .font(.title3)
                        
                        Stepper("\(noToMultiply)", value: $noToMultiply, in: 2...12, step:1)
                        .frame(maxWidth: 150)
                        
                        Spacer()
                    
                        Text("How many practice questions do you want?")
                            .font(.title3)
                        Picker("", selection: $question){
                            ForEach(questions, id:\.self) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(.segmented)
                        .frame(maxWidth: 200)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 25)
                    .background(.regularMaterial)
                    .clipShape(.rect(cornerRadius: 20))
                    
                    Spacer()
                    Spacer()
                    
                    VStack(spacing: 15) {
                        Spacer()
                        
                        Image(icons[number])
                            .rotation3DEffect(
                                .degrees(animateIcon ? animationAmount : 0.0),axis: (x: 0.0, y: 1.0, z: 0.0)
                            )
                            .animation(.default, value: animateIcon)
                        
                        Spacer()
                        
                        Text("What is \(noToMultiply) x \(number) ?")
                            .font(.title2).bold()
                        
                        TextField("Answer", value: $answer, format: .number)
                            .foregroundStyle(answer == correctAnswer ? .black : .red)
                            .textFieldStyle(.roundedBorder)
                            .onSubmit{checkAnswer()}
                            .frame(maxWidth: 200)
                            .alert(alertTitle, isPresented: $showingScore){
                                Button("Continue", action: askQuestion)
                            } message: {
                                Text(alertMessage)
                            }
                            .alert("Game Over", isPresented: $restartGame){
                                Button("Play Again", action: restart)
                            } message: {
                                Text("Your Final Score is \(score)/\(question)")
                            }
                        
                        Spacer()
                        
                        Text("\(count) of \(question) questions answered")
                            .fontWeight(.medium)
                        
                        
                        Button("Start Over"){
                            restart()
                        }
                        .padding()
                        .background(.green)
                        .fontWeight(.bold)
                        .clipShape(.capsule)
                    }
                    .foregroundStyle(.white)
                }
                .navigationTitle("MultiplyWithMe")
                .padding()
            }
        }
    }
    
    func checkAnswer(){
        correctAnswer = noToMultiply * number
        if answer == correctAnswer {
            score += 1
            alertTitle = "Good Job!"
            alertMessage = "That is correct."
            
            animationAmount = 360.0
            animateIcon.toggle()
        } else {
            alertTitle = "Uh Oh!"
            alertMessage = "The correct answer is \(correctAnswer)."
        }
        showingScore = true
        count += 1
    }
    
    func askQuestion(){
        correctAnswer = 0
        answer = 0
        if count < question {
            number = Int.random(in: 0..<15)
        }
        else {
            restartGame = true
        }
        
    }
    
    func restart() {
        score = 0
        count = 0
        answer = 0
        correctAnswer = 0
        askQuestion()
        }
    
}
    
        
#Preview {
    ContentView()
}


