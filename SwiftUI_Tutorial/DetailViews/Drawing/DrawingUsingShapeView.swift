//
//  DrawingUsingShapeView.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 8/16/23.
//

import SwiftUI

struct DrawingUsingShapeView: View {
    //MARK: - Properties
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    @State private var trapezoidAmount = 50.0
    @State private var rows = 1
    @State private var columns = 1
    
    //MARK: - Body
    var body: some View {
        ScrollView {
            VStack {
                Triangle()
                    .fill(.red)
                    .frame(width: 300, height: 300)
                Spacer(minLength: 50)
                Triangle()
                    .stroke(.orange, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                    .frame(width: 300, height: 300)
                Spacer(minLength: 50)
                Circle()
                    .stroke(.mint, lineWidth: 20)
                    .frame(width: 300, height: 300)
                Spacer(minLength: 250)
                Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockWise: true)
                    .inset(by: 10)
                Spacer(minLength: 250)
                Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                    .stroke(.purple)
                Spacer(minLength: 250)
            }
            VStack {
                Trapezoid(insetAmount: trapezoidAmount)
                    .frame(width: 200, height: 100)
                    .onTapGesture {
                        withAnimation {
                            trapezoidAmount = Double.random(in: 10...100)
                        }
                    }
                CheckerBoard(rows: rows, columns: columns)
                    .frame(width: 420, height: 400)
                    .onTapGesture {
                        withAnimation(.linear(duration: 3)) {
                            rows += 1
                            columns += 1
                        }
                    }
            }
        }
        .navigationTitle("Drawing With Shape")
    }
}

struct DrawingUsingShapeView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingUsingShapeView()
    }
}
