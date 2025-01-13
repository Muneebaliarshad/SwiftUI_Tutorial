//
//  GradientExample.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 8/7/23.
//

import SwiftUI

struct GradientExample: View {
    //MARK: - Body
    var body: some View {
        Form {
            LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
                .frame(height: 500)
            RadialGradient(colors: [.indigo, .black], center: .center, startRadius:  0, endRadius: 200)
                .frame(height: 500)
            AngularGradient(colors: [.cyan, .blue, .mint, .orange, .yellow, .indigo], center: .center)
                .frame(height: 500)
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 300)
            .frame(height: 500)
        }
        .navigationTitle("Gradient")
    }
}

struct GradientExample_Previews: PreviewProvider {
    static var previews: some View {
        GradientExample()
    }
}
