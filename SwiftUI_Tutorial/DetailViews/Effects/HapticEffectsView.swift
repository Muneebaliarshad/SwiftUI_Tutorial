//
//  HapticEffectsView.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 2/9/24.
//

import SwiftUI
import CoreHaptics

struct HapticEffectsView: View {
    // MARK: - Properties
    @State private var counter1 = 0
    @State private var counter2 = 0
    @State private var engine: CHHapticEngine?

    //MARK: - Body
    var body: some View {
        ///Default
        Button("Default Haptic Effect With Counter: \(counter1)") {
            counter1 += 1
        }
        .buttonStyle(.borderedProminent)
        .tint(.mint)
        .sensoryFeedback(.increase, trigger: counter1)
        ///Impact
        Button("Impact Haptic Effect With Counter: \(counter2)") {
            counter1 += 1
        }
        .buttonStyle(.borderedProminent)
        .tint(.purple)
        .sensoryFeedback(.impact(flexibility: .soft, intensity: 1 ), trigger: counter2)

        Button("Play Haptic") {
            complexSuccess()
        } 
        .tint(.green)
        .onAppear(perform: prepareHaptics)
    }

    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }

    func complexSuccess() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()
        let intesity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intesity, sharpness], relativeTime: 0)
        events.append(event)

        do {
            let pattren = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattren)
            try player?.stop(atTime: 0)
        } catch {
            print("Failed tp Play Pattren: \(error.localizedDescription)")
        }
    }
}

#Preview {
    HapticEffectsView()
}
