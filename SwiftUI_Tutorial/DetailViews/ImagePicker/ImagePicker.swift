//
//  ImagePicker.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 11/7/23.
//

import PhotosUI
import SwiftUI

class Coordinator: NSObject, PHPickerViewControllerDelegate {
    //MARK: - Variables
    var parent: ImagePicker

    //MARK: - Init Methods
    init(_ parent: ImagePicker) {
        self.parent = parent
    }

    //MARK: - PHPickerViewControllerDelegate
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        guard let provider = results.first?.itemProvider else { return }

        if provider.canLoadObject(ofClass: UIImage.self) {
            provider.loadObject(ofClass: UIImage.self) { image, _ in
                self.parent.image = image as? UIImage
            }
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    //MARK: - Variables
    @Binding var image: UIImage?

    //MARK: - UIViewControllerRepresentable
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images

        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
    }

    //MARK: - Helper Methods
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
