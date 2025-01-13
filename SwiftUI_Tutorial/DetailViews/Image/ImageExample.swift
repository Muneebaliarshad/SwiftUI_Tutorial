//
//  ImageExample.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 8/7/23.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ImageExample: View {
    //MARK: - Variables
    @State private var image: Image?

    //MARK: - Body
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image(systemName: "clock")
                Image("apollo1")
                    .resizable()
                    .scaledToFill()
                    .frame(width:  0, height: 200)
                Text("One Piece")
                    .frame(width: 300, height: 300)
                    .border(ImagePaint(image: Image("aldrin"), scale: 0.2), width: 50)
                Image("apollo11")
                    .resizable()
                    .scaledToFill()
                    .frame(width:  0, height: 200)
                    .colorMultiply(.blue)
                AsyncImage(url: URL(string: "https://f.ptcdn.info/714/079/000/rpe22xor4cS3HvXJstPo-o.jpg")) { image in
                    image
                        .resizable()//"LU"
                        .scaledToFit()
                } placeholder: {
                    Color.mint
                }
                .frame(width: 200, height: 200)
                AsyncImage(url: URL(string: "https://f.ptcdn.info/714/079/000/rpe22xor4cS3HvXJstPo-o.jpg")) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else if phase.error != nil {
                        Text("There was an error loading the image.")
                    } else {
                        ProgressView()
                    }
                }
                .frame(width: 200, height: 200)
                image?
                    .resizable()
                    .scaledToFit()
            }
            .onAppear(perform: loadCoreImage)
            .navigationTitle("Image")
        }
    }

    func loadCoreImage() {
        guard let inputImage = UIImage(named: "apollo7") else { return }
        let beginImage = CIImage(image: inputImage)
        let context = CIContext()

        let currentFilter = CIFilter.sepiaTone()
        //        let currentFilter = CIFilter.pixellate()
        currentFilter.inputImage = beginImage

        let amount = 1.0
        let inputKeys = currentFilter.inputKeys
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(amount, forKey: kCIInputIntensityKey)
        }

        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(amount * 200, forKey: kCIInputScaleKey)
        }

        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey)
        }

        guard let outputImage = currentFilter.outputImage else { return }
        if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgImage)
            image = Image(uiImage: uiImage)
        }
    }
}

struct ImageExample_Previews: PreviewProvider {
    static var previews: some View {
        ImageExample()
    }
}
