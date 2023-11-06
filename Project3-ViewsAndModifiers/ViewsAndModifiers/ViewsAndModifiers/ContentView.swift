//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Busayo Ajide on 11/5/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            
            Text("This is a blue title text")
                .BlueStyle()
            Spacer()
            Text("Welcome")
                .BlueStyle()
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .padding()
            Text("Hello, world!")
                
            Spacer()
            Spacer()
            Spacer()
        }
        .padding()
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.blue)
            .bold()
            
    }
}

extension View {
    func BlueStyle() -> some View {
        modifier(Title())
    }
}

#Preview {
    ContentView()
}
