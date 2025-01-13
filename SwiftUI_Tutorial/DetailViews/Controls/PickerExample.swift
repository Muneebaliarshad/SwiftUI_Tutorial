//
//  PickerExample.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 8/7/23.
//

import SwiftUI

struct PickerExample: View {
    //MARK: - Properties
    let city = ["Rawalpindi", "Islamabad", "Bangkok"]
    @State private var selectedCity = "Bangkok"
    
    //MARK: - Body
    var body: some View {
        VStack(spacing: 60) {
            Picker("Select City", selection: $selectedCity) {
                ForEach(city, id: \.self) {
                    Text($0)
                }
            }
            Picker("Select Count", selection: $selectedCity) {
                ForEach(city, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.navigationLink)
            Picker("Select Count", selection: $selectedCity) {
                ForEach(city, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            Picker("Select Count", selection: $selectedCity) {
                ForEach(city, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.wheel)
        }
        .padding(50)
        .navigationTitle("Pickers")
    }
}

struct PickerExample_Previews: PreviewProvider {
    static var previews: some View {
        PickerExample()
    }
}
