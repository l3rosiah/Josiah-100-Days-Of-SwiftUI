//
//  ContentView.swift
//  Animations
//
//  Created by Grace Filippi on 11/11/23.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct ContentView: View {
    @State private var isShowingRed = false
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 1)) {
                isShowingRed.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}


//
//Button("Tap Me") {
//    withAnimation(.spring(duration: 1, bounce: 0.5)) {
//        animationAmount += 360
//    }
//}
//.padding(50)
//.background(.red)
//.foregroundStyle(.white)
//.clipShape(.circle)
//.rotation3DEffect(
//    .degrees(animationAmount), axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
//)
//
//Button("Tap Me") {
//    // do nothing
//}
//.background(.blue)
//.frame(width: 200, height: 200)
//.foregroundStyle(.white)
//
//Button("Tap Me") {
//    enabled.toggle()
//}
//.frame(width: 200, height: 200)
//.background(enabled ? .blue : .red)
//.foregroundStyle(.white)
//.animation(nil, value: enabled)
//.clipShape(.rect(cornerRadius: enabled ? 60 : 0))
//.animation(.spring(duration: 1, bounce: 0.6), value: enabled)

//print(animationAmount)
//
//return VStack {
//    Stepper("Scale amount: \(animationAmount.formatted())", value: $animationAmount.animation(
//        .easeInOut(duration: 1)
//            .repeatCount(3, autoreverses: true)
//    ), in: 1...10)
//    Spacer()
//    
//    Button("Tap Me") {
//        animationAmount += 1
//    }
//    .padding(50)
//    .background(.red)
//    .foregroundStyle(.white)
//    .clipShape(.circle)
//    .scaleEffect(animationAmount)
//    
//    Spacer()
//}
//.padding()

//
//Button("Tap Me") {
//}
//.padding(50)
//.background(.red)
//.foregroundStyle(.white)
//.clipShape(.circle)
//.overlay(
//    Circle()
//        .stroke(.red)
//        .scaleEffect(animationAmount)
//        .opacity(2 - animationAmount)
//        .animation(
//            .easeOut(duration: 1)
//                .repeatForever(autoreverses: false),
//            value: animationAmount
//        )
//)
