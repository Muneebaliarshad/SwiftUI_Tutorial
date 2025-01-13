//
//  NormalControls.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 8/7/23.
//

import SwiftUI

struct NormalControls: View {
    //MARK: - Properties
    @State private var tapCount = 0
    @State private var userName = ""
    @State private var notes = ""
    
    //MARK: - Body
    var body: some View {
        Form {
            Text("This is Group and your name is \(userName)")
                .padding(20)
            Button("Tap Count: \(tapCount)") {
                tapCount += 1
            }
            .padding(20)
            TextField("Enter Your Name:", text: $userName)
                .padding(20)
            TextEditor(text: $notes)
                .padding()
        }
        .navigationTitle("Normal Controls")
    }
}

struct NormalControls_Previews: PreviewProvider {
    static var previews: some View {
        NormalControls()
    }
}
