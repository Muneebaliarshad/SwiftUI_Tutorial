//
//  GestureExample.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 8/7/23.
//

import SwiftUI

struct GestureExample: View {
    //MARK: - Properties
    @State private var dragAmount = CGSize.zero
    
    //MARK: - Body
    var body: some View {
        VStack {
            LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 300, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 5)
                .offset(dragAmount)
                .gesture(
                    DragGesture()
                        .onChanged{ dragAmount = $0.translation }
                        .onEnded{ _ in
                            withAnimation {
                                dragAmount = .zero
                            }
                        }
                )
        }
        .navigationTitle("Gesture")
    }
}

struct GestureExample_Previews: PreviewProvider {
    static var previews: some View {
        GestureExample()
    }
}
