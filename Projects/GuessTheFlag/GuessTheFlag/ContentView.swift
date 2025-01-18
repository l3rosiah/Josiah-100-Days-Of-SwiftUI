//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Grace Filippi on 11/1/23.
//

import SwiftUI

struct FlagImage: View {
    var text: String
    
    var body: some View {
        Image(text)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreValue = 0
    @State private var attempts = 0
    @State private var rotationVar = 0.0
    @State private var selectedFlag = false
    
    let labels = [
        "Estonia": "Flag with three horizontal stripes. Top stripe blue, middle stripe black, bottom stripe white.",
        "France": "Flag with three vertical stripes. Left stripe blue, middle stripe white, right stripe red.",
        "Germany": "Flag with three horizontal stripes. Top stripe black, middle stripe red, bottom stripe gold.",
        "Ireland": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe orange.",
        "Italy": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe red.",
        "Nigeria": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe green.",
        "Poland": "Flag with two horizontal stripes. Top stripe white, bottom stripe red.",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red.",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background.",
        "Ukraine": "Flag with two horizontal stripes. Top stripe blue, bottom stripe yellow.",
        "US": "Flag with many red and white stripes, with white stars on a blue background in the top-left corner."
    ]
    
    
    
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
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3) { number in
                        Button {
                            withAnimation(.easeInOut(duration: 1)) {
                                flagTapped(number)
                                selectedFlag.toggle()
                                //rotationVar += 360
                            }
                        } label: {
                            FlagImage(text: countries[number])
                        }
                        .accessibilityLabel(labels[countries[number], default: "Unknown flag"])
                        .rotation3DEffect(selectedFlag && number == correctAnswer ? .degrees(360) : .zero, axis: (x: 0, y: 1, z: 0))
                        .scaleEffect(selectedFlag && number != correctAnswer ? CGSize(width: 0.5, height: 0.5) : CGSize(width: 1, height: 1))
                        .blur(radius: selectedFlag && number != correctAnswer ? 9 : 0)
                        .opacity(selectedFlag && number != correctAnswer ? 0.25 : 1)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(scoreValue)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button(attempts == 8 ? "Restart" : "Continue") {
                askQuestion()
                if attempts == 8 {
                    scoreValue = 0
                    attempts = 0
                }
            }
        } message: {
            if attempts < 8 {
                Text("Your score is \(scoreValue)")
            } else {
                Text("Your final score is \(scoreValue)/8!")
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            scoreValue += 1
            attempts += 1
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])!"
            attempts += 1
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        selectedFlag = false
    }
}

#Preview {
    ContentView()
}
