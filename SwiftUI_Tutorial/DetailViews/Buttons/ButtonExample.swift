//
//  ButtonExample.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 8/7/23.
//

import SwiftUI

struct ButtonExample: View {
    //MARK: - Properties
    @State private var isAlertShowing = false
    @State private var rememberMe = false
    
    //MARK: - Body
    var body: some View {
        VStack(spacing: 30) {
            Button("Button Example 1", role: .destructive, action: buttonAction)
            Button("Button Example 2") {}
                .buttonStyle(.bordered)
            Button("Button Example 3") {}
                .buttonStyle(.borderedProminent)
            Button("Button Example 4", role: .destructive) {}
                .buttonStyle(.borderedProminent)
            Button("Button Example 5") {}
                .buttonStyle(.borderedProminent)
                .tint(.mint)
            Button {
                print("Custom Button 1 Tapped")
            } label: {
                Text("Tap Me!!!!")
                    .padding()
                    .foregroundColor(.white)
                    .background(.purple)
            }
            Button {
                print("Custom Button 2 Tapped")
            } label: {
                Image(systemName: "clock")
            }
            Button {
                print("Custom Button 2 Tapped")
                isAlertShowing = true
            } label: {
                Label("Alert", systemImage: "lanyardcard")
                    .symbolRenderingMode(.multicolor)
            }
            .alert("This Is Sample Alert", isPresented: $isAlertShowing) {
                Button("OK") {}
                Button("Cancel", role: .destructive) {}
            } message: {
                Text("Is is Alert Message")
            }
            Button {
                print("Custom Button 2 Tapped")
            } label: {
                Image("Diamond")
                    .renderingMode(.original)
                    .clipShape(Capsule(style: .circular))
                    .shadow(radius: 5)
            }
            PushButton(title: rememberMe ? "On State" : "Off State", isOn: $rememberMe)
        }
    }
    
    //MARK: - Actions
    func buttonAction() {
        print("Button Test Successfull")
    }
}

struct ButtonExample_Previews: PreviewProvider {
    static var previews: some View {
        ButtonExample()
    }
}
