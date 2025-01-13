//
//  StackExample.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 8/7/23.
//

import SwiftUI

struct StackExample: View {
    //MARK: - Body
    var body: some View {
        Form {
            VStack(spacing: 20) {
                Text("This is Vertical")
                Text("* Stack *")
            }
            .padding(20)
            HStack(spacing: 20) {
                Text("This is Horizontal")
                Text("* Stack *")
            }
            .padding(20)
            ZStack {
                Text("This is Zonal")
                Text("* Stack *")
            }
            .padding(20)
        }
        .navigationTitle("Stacks")
    }
}

struct StackExample_Previews: PreviewProvider {
    static var previews: some View {
        StackExample()
    }
}
