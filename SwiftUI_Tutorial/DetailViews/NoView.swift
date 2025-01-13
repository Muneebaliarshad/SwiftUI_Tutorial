//
//  NoView.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 8/15/23.
//

import SwiftUI

struct NoView: View {
    // MARK: - Properties
    
    //MARK: - Bod
    var body: some View {
        Text("Hello, World!")
            .navigationTitle("No View")
    }
}

struct NoView_Previews: PreviewProvider {
    static var previews: some View {
        NoView()
    }
}
