//
//  ContentView.swift
//  BetterRest
//
//  Created by Busayo Ajide on 11/7/23.
//

import CoreML
import SwiftUI

struct ContentView: View {
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defaultWakeTime
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack{
            Form {
                //VStack(alignment: .leading, spacing: 0)
                Section ("When do you want to wake up?") {
                    //Text("When do you want to wake up?")
                    //  .font(.headline)
                    
                    DatePicker("", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                // VStack(alignment: .leading, spacing: 0)
                Section ("Desired amount of sleep"){
                    //Text("Desired amount of sleep")
                    //  .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                //VStack(alignment: .leading, spacing: 0)
                Section ("Daily coffee intake"){
                    //Text("Daily coffee intake")
                    //  .font(.headline)
                    Picker("No of cups",selection: $coffeeAmount){
                        ForEach(1...20, id:\.self){
                            Text($0, format: .number)
                        }
                    }
                }
                //Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
                Section ("Recommended bedtime"){
                    Text(calculateBedtime())
                        //.onAppear(perform: calculateBedtime)
                        .font(.largeTitle)
                }
            }
            .navigationTitle("BetterRest")
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
            //.toolbar {
               // Text(calculateBedtime())
                 //   .font(.largeTitle)
                //Button("Calculate", action: calculateBedtime)
            //}
    }
}
    
    
    func calculateBedtime() -> String {
        do {        
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            
            let prediction = try model.prediction(wake: Int64((hour + minute)), estimatedSleep: sleepAmount, coffee: Int64(coffeeAmount))
            
            //let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))

            let sleepTime = wakeUp - prediction.actualSleep

            alertTitle = "Your ideal bedtime is…"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            return "\(sleepTime.formatted(date: .omitted, time: .shortened))"
            // more code here
        } catch {
            // something went wrong!
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
            return "Sorry, there was a problem calculating your bedtime."
        }
        
        //return alertMessage
        showingAlert = true

    }
    
    
}

#Preview {
    ContentView()
}
