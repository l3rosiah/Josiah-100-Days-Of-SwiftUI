//
//  ContentView.swift
//  multiplyer
//
//  Created by Grace Filippi on 11/29/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showSettingScreen = true
    let questionAmounts = [5, 10, 20]
    @State private var numberOfQuestions: Int = 5
    @State private var highestTable = 8
    @State private var questionsFirst = [Int]()
    @State private var questionsSecond = [Int]()
    @State private var questionsAnswer = [Int]()
    @State private var questionResults = [String]()
    @State private var questionResultsCorrect = [Bool]()
    @State private var titleText = "Settings"
    @State private var currentQuestionNum = 0
    var currentQuestion: String {
        return "\(questionsFirst[currentQuestionNum]) x \(questionsSecond[currentQuestionNum]) = ?"
    }
    @State private var guessValue = ""
    @State private var showEndAlert = false
    @State private var score = 0
    
    var body: some View {
        NavigationStack {
            if !showSettingScreen {
                VStack {
                    Text(titleText)
                        .font(.largeTitle)
                    TextField("Input your answer: ", text: $guessValue)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(.yellow)
                    Spacer()
                    List {
                        ForEach(questionResults, id: \.self) { value in
                            Text(value)
                        }
                    }
                }
                .onSubmit(submitAnswer)
                .alert("That's all folks!", isPresented: $showEndAlert) { 
                    Button("OK") {
                        showSettingScreen = true
                        score = 0
                        
                    }
                } message: {
                    Text("You did it! Your score was: \(score)")
                }
            } else {
                VStack {
                    Text("Settings")
                        .font(.largeTitle)
                    Form {
                        Section("") {
                            VStack {
                                Text("How many problems would you like?")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Picker("Number of problems: ", selection: $numberOfQuestions) {
                                    ForEach(questionAmounts, id: \.self) {
                                        Text($0, format: .number)
                                    }
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        Section("") {
                            Picker("Highest times table: ", selection: $highestTable) {
                                ForEach(2..<13, id: \.self) {
                                    Text($0, format: .number)
                                }
                            }
                        }
                    }
                    Button("Let's Go!") {
                        showSettingScreen.toggle()
                        createQuestions(numberOfQuestions: numberOfQuestions, highestTable: highestTable)
                        currentQuestionNum = 0
                        titleText = currentQuestion
                    }
                    .foregroundStyle(.white)
                    .font(.title)
                    .frame(width: 200, height: 200, alignment: .center)
                    .background(.green)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding()
                }
            }
        }
    }
    
    // Functions
    
    func createQuestions(numberOfQuestions: Int, highestTable: Int) {
        questionsFirst = []
        questionsSecond = []
        questionsAnswer = []
        questionResults = []
        questionResultsCorrect = []
        for _ in 0..<numberOfQuestions {
            let firstMultiple = Int.random(in: 2...highestTable)
            let secondMultiple = Int.random(in: 2...highestTable)
            questionsFirst.append(firstMultiple)
            questionsSecond.append(secondMultiple)
            questionsAnswer.append(firstMultiple * secondMultiple)
        }
    }
    
    func submitAnswer() {
        let answer = guessValue.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        
        let fullString = "\(questionsFirst[currentQuestionNum]) x \(questionsSecond[currentQuestionNum]) = \(answer)"
        
        let correctAnswer = questionsFirst[currentQuestionNum] * questionsSecond[currentQuestionNum]
        
        if answer == "\(correctAnswer)" {
            score += 1
        }
        
        withAnimation {
            questionResults.insert(fullString, at: 0)
        }
        
        guessValue = ""
        currentQuestionNum += 1
        if currentQuestionNum == numberOfQuestions {
            showEndAlert = true
        }
        titleText = currentQuestion
        
    }
}



#Preview {
    ContentView()
        .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
}
