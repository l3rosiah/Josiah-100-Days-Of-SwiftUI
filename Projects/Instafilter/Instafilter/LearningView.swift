//
//  Learning.swift
//  Instafilter
//
//  Created by Grace Filippi on 1/6/24.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct LearningView: View {
    @State private var blurAmount = 0.0
    @State private var showingDialog = false
    @State private var backgroundColor = Color.white
    @State private var image: Image?

    var body: some View {
        VStack {
            Text("Hello, World!")
                .blur(radius: blurAmount)

            Slider(value: $blurAmount, in: 0...20)
                .onChange(of: blurAmount) { oldValue, newValue in
                    print("New value is: \(newValue)")
                }

            Button("Hello World") {
                showingDialog = true
            }
            .frame(width: 300, height: 300)
            .background(backgroundColor)
            .confirmationDialog("Change Background", isPresented: $showingDialog) {
                Button("Red") { backgroundColor = .red }
                Button("Green") { backgroundColor = .green }
                Button("Blue") { backgroundColor = .blue }
                Button("Yellow") { backgroundColor = .yellow }
                //Button("Cancel", role: .cancel) { }
            } message: {
                Text("Select a new color")
            }
        }
    }
    func loadImage() {
        let inputImage = UIImage(resource: .singapore4X)
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
        
        let currentFilter = CIFilter.sepiaTone()
        currentFilter.inputImage = beginImage
        
        let amount = 0.8
        
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(amount, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey) }
        
        guard let outputImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        let uiImage = UIImage(cgImage: cgImage)
        image = Image(uiImage: uiImage)
    }
}

#Preview {
    LearningView()
}
