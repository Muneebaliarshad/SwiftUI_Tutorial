//
//  ListExample.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 8/7/23.
//

import SwiftUI

struct ListExample: View {
    //MARK: - Properties
    @State private var rows = [Int]()
    @State private var currentNumber = 1
    let layout = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    //MARK: - Body
    var body: some View {
        VStack {
            List {
                Section {
                    Text("Static cell 1")
                    Text("Static cell 2")
                } header: {
                    Text("Section 1")
                }
                Section {
                    ForEach(rows, id: \.self) {
                        Text("Dynamic cell \($0)")
                    }
                    .onDelete(perform: deleteRow)
                } header: {
                    Text("Section 2")
                }
                Section {
                    LazyVGrid(columns: layout) {
                        ForEach(0..<1000) {
                            Text("Item \($0)")
                        }
                    }
                } header: {
                    Text("Section 3")
                }
            }
            HStack(spacing: 30) {
                Button("Add Row") {
                    rows.append(currentNumber)
                    currentNumber += 1
                }
                .buttonStyle(.borderedProminent)
                .tint(.mint)
                Button("Delete Row", role: .destructive) {
                    if rows.count > 0 {
                        rows.remove(at: (rows.count - 1))
                    } else {
                        currentNumber = 1
                    }
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .navigationTitle("List")
    }
    
    func deleteRow(at offsets: IndexSet) {
        if rows.count == 1 {
            currentNumber = 1
        }
        rows.remove(atOffsets: offsets)
    }
}

struct ListExample_Previews: PreviewProvider {
    static var previews: some View {
        ListExample()
    }
}
