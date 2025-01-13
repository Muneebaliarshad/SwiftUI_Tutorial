//
//  ViewsExample.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 8/9/23.
//

import SwiftUI

struct ViewsExample: View {
    //MARK: - Body
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(0..<100) {
                    Text("Item \($0)")
                }
            }
            .frame(maxWidth: .infinity)
        }
        .navigationTitle("View")
    }
}

struct ViewsExample_Previews: PreviewProvider {
    static var previews: some View {
        ViewsExample()
    }
}
