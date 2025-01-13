//
//  DrawingView.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 8/16/23.
//

import SwiftUI

struct DrawingUsingPathView: View {
    //MARK: - Body
    var body: some View {
        ScrollView {
            VStack {
                Path { path in
                    path.move(to: CGPoint(x: 200, y: 100))
                    path.addLine(to: CGPoint(x: 100, y: 300))
                    path.addLine(to: CGPoint(x: 300, y: 300))
                    path.addLine(to: CGPoint(x: 200, y: 100))
                }
                .fill(.mint)
                Spacer(minLength: 250)
                Path { path in
                    path.move(to: CGPoint(x: 200, y: 100))
                    path.addLine(to: CGPoint(x: 100, y: 300))
                    path.addLine(to: CGPoint(x: 300, y: 300))
                    path.addLine(to: CGPoint(x: 200, y: 100))
                    path.closeSubpath()
                }
                .stroke(.brown, lineWidth: 10)
                Spacer(minLength: 250)
                Path { path in
                    path.move(to: CGPoint(x: 200, y: 100))
                    path.addLine(to: CGPoint(x: 100, y: 300))
                    path.addLine(to: CGPoint(x: 300, y: 300))
                    path.addLine(to: CGPoint(x: 200, y: 100))
                }
                .stroke(.yellow, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            }
        }
        .navigationTitle("Drawing With Path")
    }
}

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingUsingPathView()
    }
}
