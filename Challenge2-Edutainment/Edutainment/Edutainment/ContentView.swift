//
//  ContentView.swift
//  Edutainment
//
//  Created by Busayo Ajide on 11/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var noToMultiply = 5
    @State private var question = 10
    @State private var answer = 0
    @State private var score = 0
    
    @State private var correctAnswer = 0
    @State private var number = Int.random(in: 2...25)
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingScore = false
    
    @State private var count = 0
    @State private var restartGame = false
    
    let questions = [5, 10, 20]
    //static let multipliers = 2...30
    
    var body: some View {
        NavigationStack{
            VStack{
                
                Text("Score - \(score)").font(.title2)
                
                VStack{
                    Form {
                        // Pick nos to multiply from 2 to 12
                        Section("Choose a number between 2 and 12"){
                            Stepper("\(noToMultiply)", value: $noToMultiply, in: 2...12, step:1)
                            //HStack{
                              //  ForEach(2..<13, id: \.self){ no in
                                //    Button("\(no)"){
                                  //      noToMultiply = no
                                    //}
                                  //  .padding()
                                 //   .background(.blue)
                                 //   .foregroundStyle(.white)
                                 //   .clipShape(.capsule)
                               // }
                           // }
                        }
                        
                        //Pick how many numbers to practice
                        Section("How many questions do you want"){
                            Picker("", selection: $question){
                                ForEach(questions, id:\.self) {
                                    Text("\($0) questions")
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        
                        //Randomly generate questions based on 2 above
                        Section("\(noToMultiply) times table"){
                            VStack {
                                //use imaages or emojis for no to multiply
                                //Text("\(noToMultiply) x \(number + 1) = ")
                                Text("What is \(noToMultiply) x \(number) ?")
                                TextField("Answer", value: $answer, format: .number)
                                    .textFieldStyle(.roundedBorder)
                                // more to come
                                //format answer to change to red text if value is wrong
                            }
                            .onSubmit{checkAnswer()}
                            .alert(alertTitle, isPresented: $showingScore){
                                Button("Continue", action: askQuestion)
                            } message: {
                                Text(alertMessage)
                            }
                            .alert("Game Over", isPresented: $restartGame){
                                Button("Play Again", action: restart)
                            } message: {
                                Text("Your Final Score is \(score)")
                            }
                        }
                    }
                }
                    
                Text("\(count) of \(question) questions answered")
                    .padding()
                
                Spacer()
                
                Button("New Game"){
                        restart()
                    }
                    .padding()
                    .background(.green)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
                    
                Spacer()
                Spacer()
            }
            .navigationTitle("Learn to Multiply")
            
        }
        
    }
    
    func checkAnswer(){
        correctAnswer = noToMultiply * number
        if answer == correctAnswer {
            score += 1
            alertTitle = "Good Job!"
            alertMessage = "That is correct."
            
        } else {
            alertTitle = "Uh Oh!"
            alertMessage = "The correct answer is \(correctAnswer)."
        }
        showingScore = true
    }
    
    func askQuestion(){
        count += 1
        if count < question {
            number = Int.random(in: 2...25)
            answer = 0
        }
        else {
            restartGame = true
        }
    }
    
    func restart() {
        score = 0
        count = 0
        askQuestion()
        }
    
}
    
        
#Preview {
    ContentView()
}


