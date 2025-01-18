//
//  AddView-ViewModel.swift
//  MemoryFace
//
//  Created by Grace Filippi on 2/19/24.
//

import SwiftUI
import PhotosUI
import CoreImage

extension AddView {
    @Observable
    class ViewModel {
        
        var name = ""
        var selectedItem: PhotosPickerItem?
        var selectedImage: Image?
        
        let context = CIContext()
        
        func loadImage() {
            Task {
                guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
                guard let inputImage = UIImage(data: imageData) else { return }
                
                guard let beginImage = CIImage(image: inputImage) else { return }
                guard let cgImage = context.createCGImage(beginImage, from: beginImage.extent) else { return }
                let uiImage = UIImage(cgImage: cgImage)
                selectedImage = Image(uiImage: uiImage)
            }
        }

        
    }
}
