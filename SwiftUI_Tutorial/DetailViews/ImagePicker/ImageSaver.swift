//
//  ImageSaver.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 11/8/23.
//

import UIKit

class ImageSaver: NSObject {

    //MARK: - Methods
    func writeToPhotoAlbums(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }

    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save Finished!!!!!")
    }
}
