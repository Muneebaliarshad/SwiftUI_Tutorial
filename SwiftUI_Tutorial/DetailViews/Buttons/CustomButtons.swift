//
//  CustomButtons.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 9/8/23.
//

import SwiftUI

struct PushButton: View {
    //MARK: - Variables
    let title: String
    @Binding var isOn: Bool
    var onColors = [Color.yellow, Color.orange]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    //MARK: - Body
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(
            LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom)
        )
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}
