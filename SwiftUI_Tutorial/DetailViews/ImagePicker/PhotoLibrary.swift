//
//  PhotoLibrary.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 11/7/23.
//

import SwiftUI

struct PhotoLibrary: View {
    //MARK: - Variables
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = false

    //MARK: -
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            Button("Select Image") {
                showingImagePicker = true
            }
            Button("Save Image") {
                guard let inputImage = inputImage else { return }
                let imageSaver = ImageSaver()
                imageSaver.writeToPhotoAlbums(image: inputImage)
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image:  $inputImage)
        }
        .onChange(of: inputImage, { oldValue, newValue in
            loadImage()
        })
    }

    //MARK: - Helper Methods
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

#Preview {
    PhotoLibrary()
}
