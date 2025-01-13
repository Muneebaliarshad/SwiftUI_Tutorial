//
//  ColorExample.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 8/7/23.
//

import SwiftUI

struct ColorExample: View {
    //MARK: - Properties
    @State private var colorCycle = 0.0
    @State private var amount = 0.0
    
    //MARK: - Body
    var body: some View {
        ScrollView(showsIndicators: false, content: {
            VStack(spacing: 50) {
                ZStack {
                    VStack(spacing: 0) {
                        Color.mint
                            .frame(height: 300)
                        Color.cyan
                            .frame(height: 300)
                    }
                    Text("Color Example")
                        .foregroundStyle(.secondary)
                        .padding(100)
                        .background(.ultraThinMaterial)
                }
                ColorCyclingCircle(amount: colorCycle)
                    .frame(width: 400, height: 400)
                Slider(value: $colorCycle)
                    .padding()
                ZStack {
                    Circle()
                        .fill(.red)
                        .frame(width: 300 * amount)
                        .offset(x: -50, y: -50)
                        .blendMode(.screen)
                    Circle()
                        .fill(.green)
                        .frame(width: 300 * amount)
                        .offset(x: 50, y: -50)
                        .blendMode(.screen)
                    Circle()
                        .fill(.blue)
                        .frame(width: 300 * amount)
                        .offset(x: 0, y: 50)
                        .blendMode(.screen)
                }
                .frame(width: 420, height: 420)
                .background(.black)
                Slider(value: $amount)
                    .padding()
            }
        })
        .navigationTitle("Color")
    }
}

struct ColorExample_Previews: PreviewProvider {
    static var previews: some View {
        ColorExample()
    }
}

struct ColorCyclingCircle: View {
    //MARK: - Properties
    var amount = 0.0
    var steps = 100
    
    //MARK: - Body
    var body: some View{
        ZStack {
            ForEach(0..<steps, id: \.self) { value in
                Circle()
                    .inset(by: Double(value))
                    .strokeBorder(color(for: value, brightness: 1), lineWidth: 1)
            }
        }
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        if targetHue > 1 {
            targetHue -= 1
        }
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}
