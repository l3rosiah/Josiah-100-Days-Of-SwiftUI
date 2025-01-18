//
//  ContentView.swift
//  RockPaperScissors-Flip
//
//  Created by Grace Filippi on 11/5/23.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .shadow(radius: 3)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .font(.largeTitle.bold())
            .buttonStyle(.bordered)
    }
}

extension View {
    func buttonStyle() -> some View {
        modifier(ButtonStyle())
    }
}

struct WideButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity)
    }
}

extension View {
    func wideButtonStyle() -> some View {
        modifier(WideButtonStyle())
    }
}

struct ContentView: View {
    
    let moves = ["Rock", "Paper", "Scissors"]
    let winningMoves = ["Paper", "Scissors", "Rock"]
    let losingMoves = ["Scissors", "Rock", "Paper"]
    @State private var winGame = Bool.random()
    @State private var randomMove = Int.random(in: 0...2)
    @State private var score = 0
    @State private var totalTurns = 0
    @State private var showingScore = false
    
    func resetGame() {
        winGame = Bool.random()
        randomMove = Int.random(in: 0...2)
    }
    
    func scoreKeeper(didWin: Bool) {
        if totalTurns < 9 {
            if didWin {
                score += 1
                totalTurns += 1
                resetGame()
            } else {
                score -= 1
                totalTurns += 1
                resetGame()
            }
            
        } else {
            if didWin {
                score += 1
                totalTurns += 1
            } else {
                score -= 1
                totalTurns += 1
            }
            showingScore = true
        }
    }
    
    func updateScore(userMove: Int) {
        if winGame {
            if moves[userMove] == winningMoves[randomMove] {
                scoreKeeper(didWin: true)
            } else {
                scoreKeeper(didWin: false)
            }
        } else {
            if moves[userMove] == losingMoves[randomMove] {
                scoreKeeper(didWin: true)
            } else {
                scoreKeeper(didWin: false)
            }
        }
    }
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.white, Color(red: 0.4, green: 0.3, blue: 0.6)], startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()
            VStack {
                Text("Score: \(score)")
                    .font(.title)
                    .foregroundStyle(.white)
                Spacer()
                VStack(spacing: 15) {
                    Text(winGame ? "Win" : "Lose")
                        .titleStyle()
                        .foregroundColor(winGame ? .green : .red)
                    Text("Against")
                        .foregroundStyle(.white)
                    Text(moves[randomMove])
                        .titleStyle()
                        .foregroundStyle(.white)
                }
                Spacer()
                VStack(spacing: 0) {
                    Button {
                        updateScore(userMove: 0)
                    } label: {
                        Text("Rock").wideButtonStyle()
                    }.buttonStyle().foregroundStyle(Color(red: 0.1, green: 0.1, blue: 0.5))
                    
                    Button {
                        updateScore(userMove: 1)
                    } label: {
                        Text("Paper").wideButtonStyle()
                    }.buttonStyle().foregroundStyle(.white)
                    
                    Button {
                        updateScore(userMove: 2)
                    } label: {
                        Text("Scissors").wideButtonStyle()
                    }.buttonStyle().foregroundStyle(.red)
                }
                Spacer()
            }
        }
        .alert("Your final score is \(score)!", isPresented: $showingScore) {
            Button("Restart") {
                resetGame()
                score = 0
                totalTurns = 0
            }
        } message: {
            Text("The max possible score is 10").font(.subheadline)
        }
    }
}

#Preview {
    ContentView()
}
