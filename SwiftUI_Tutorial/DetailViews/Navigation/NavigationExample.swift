//
//  NavigationExample.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 8/9/23.
//

import SwiftUI

struct NavigationExample: View {
    //MARK: - Body
    var body: some View {
        NavigationView {
            List(0..<100) { row in
                NavigationLink {
                    Text("Detail view of \(row)")
                } label: {
                    Text("Row \(row)")
                }
            }
            .navigationTitle("Navigation")
        }
    }
}

struct NavigationExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationExample()
    }
}
