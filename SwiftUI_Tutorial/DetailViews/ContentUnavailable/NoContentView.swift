//
//  ContentUnavailableView.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 3/27/24.
//

import SwiftUI

struct NoContentView: View {
    //MARK: - Body
    var body: some View {
        ContentUnavailableView("No snippets", systemImage: "swift", description: Text("You don't have any saved snippets yet."))
        
        ContentUnavailableView {
            Label("No Snippets", systemImage: "iphone")
        } description: {
            Text("You don't have any saved snippets yet.")
        } actions: {
            Button("Create Snippet") { }
                .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    NoContentView()
}
