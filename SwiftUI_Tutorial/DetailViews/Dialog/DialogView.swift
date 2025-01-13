//
//  DialogView.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 3/27/24.
//

import SwiftUI

struct DialogView: View {
    //MARK: - Properties
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white

    //MARK: - Body
    var body: some View {
        Button("Tab To Change Color") {
            showingConfirmation.toggle()
        }
        .frame(width: 400, height: 400)
        .background(backgroundColor)
        .confirmationDialog("Change Background", isPresented: $showingConfirmation) {
            Button("Red") { backgroundColor = .red }
            Button("Green") { backgroundColor = .green }
            Button("Blue") { backgroundColor = .blue }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Select a new color")
        }
    }
}

#Preview {
    DialogView()
}
