//
//  StepperExample.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 8/7/23.
//

import SwiftUI

struct StepperExample: View {
    //MARK: - Properties
    @State private var stepperValue = 0
    @State private var selectedDate = Date.now
    
    //MARK: - Body
    var body: some View {
        VStack(spacing: 50) {
            Stepper("Count Data: \(stepperValue)", value: $stepperValue)
            Stepper("Count Data: \(stepperValue)", value: $stepperValue, in: 0...10)
            DatePicker("Please Select Date and Time", selection: $selectedDate)
            DatePicker("Please Select Date", selection: $selectedDate, displayedComponents: .date)
            DatePicker("Please Select Time", selection: $selectedDate, displayedComponents: .hourAndMinute)
            DatePicker("Time Limit", selection: $selectedDate, in: Date.now...)
        }
        .padding(30)
        .navigationTitle("Stepper")
    }
}

struct StepperExample_Previews: PreviewProvider {
    static var previews: some View {
        StepperExample()
    }
}
