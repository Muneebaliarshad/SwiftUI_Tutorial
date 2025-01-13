//
//  AnimationExample.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 8/7/23.
//

import SwiftUI

struct AnimationExample: View {
    //MARK: - Properties
    @State private var animationAmount = 1.0
    @State private var animationAmount2 = 0.0
    @State private var isShowData = true
    
    //MARK: - UIElements
    var animationButton: some View {
        Button("Tap") {
        }
        .padding(30)
        .background(.mint)
        .foregroundColor(.white)
        .clipShape(Circle())
    }
    
    //MARK: - Body
    var body: some View {
        List {
            Stepper("Value: \(Int(animationAmount))", value: $animationAmount)
            HStack {
                animationButton
                    .overlay(
                        Circle()
                            .stroke(.green)
                            .scaleEffect(animationAmount)
                            .opacity(2 - animationAmount)
                            .animation(.easeInOut(duration: 1)
                                .repeatForever(autoreverses: false),
                                       value: animationAmount)
                    )
                Spacer(minLength: 50)
            }
            //Ripple
            
            //Default
            animationButton
                .scaleEffect(animationAmount)
                .animation(.default, value: animationAmount)
            //Blur
            animationButton
                .blur(radius: animationAmount)
            //Spring
            animationButton
                .scaleEffect(animationAmount)
                .animation(.interpolatingSpring(stiffness: 5, damping: 1), value: animationAmount)
            //Duration
            animationButton
                .scaleEffect(animationAmount)
                .animation(.easeInOut(duration: 2), value: animationAmount)
            Button("Tap Me") {
                withAnimation {
                    animationAmount2 += 360
                    isShowData.toggle()
                }
            }
            .padding(30)
            .background(.mint)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(animationAmount2), axis: (x: 0, y: 1, z: 0))
            
            if isShowData {
                Rectangle()
                    .fill(.yellow)
                    .frame(width: 100, height: 100)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
        .navigationTitle("Animation")
    }
}

struct AnimationExample_Previews: PreviewProvider {
    static var previews: some View {
        AnimationExample()
    }
}
