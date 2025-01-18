//
//  AddView.swift
//  MemoryFace
//
//  Created by Grace Filippi on 2/18/24.
//

import SwiftUI
import PhotosUI
import CoreImage

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    
    let context = CIContext()
    
    var onSave: (Person) -> Void
    var person: Person
    
    init(person: Person, onSave: @escaping (Person) -> Void) {
        //_viewModel = State(wrappedValue: ViewModel())
        self.onSave = onSave
        self.person = person
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $name)
                }
                Section {
                    PhotosPicker(selection: $selectedItem) {
                        if let selectedImage {
                            selectedImage
                                .resizable()
                                .scaledToFit()
                        } else {
                            ContentUnavailableView("No picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                        }
                    }
                    .onChange(of: selectedItem, loadImage)
                }
            }
            .toolbar {
                Button("Save") {
                    onSave(savePerson())
                    dismiss()
                }
            }
        }
    }
    
    func savePerson() -> Person {
        var newPerson = person
        newPerson.id = UUID()
        newPerson.name = name
        return newPerson
    }
    
    func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            guard let inputImage = UIImage(data: imageData) else { return }
            
            guard let beginImage = CIImage(image: inputImage) else { return }
            guard let cgImage = context.createCGImage(beginImage, from: beginImage.extent) else { return }
            let uiImage = UIImage(cgImage: cgImage)
            selectedImage = Image(uiImage: uiImage)
            selectedImage.
        }
    }
    
}

//#Preview {
//    AddView(person: .example) { _ in }
//}
