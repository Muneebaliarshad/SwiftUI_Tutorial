//
//  StorageExample.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 8/8/23.
//

import SwiftUI

struct StorageExample: View {
    //MARK: - Properties
    @State private var userDefaultsValue = UserDefaults.standard.integer(forKey: "userData")
    @AppStorage("appStorageData") private var appStorageValue = 0
    
    //MARK: - Body
    var body: some View {
        VStack(spacing: 50) {
            Button("User Defaults Value: \(userDefaultsValue)") {
                userDefaultsValue += 1
                UserDefaults.standard.set(userDefaultsValue, forKey: "userData")
            }
            .buttonStyle(.borderedProminent)
            .tint(.mint)
            Button("User Defaults Value: \(appStorageValue)") {
                appStorageValue += 1
            }
            .buttonStyle(.borderedProminent)
            .tint(.mint)
            
        }
        .navigationTitle("Storage")
    }
}

struct StorageExample_Previews: PreviewProvider {
    static var previews: some View {
        StorageExample()
    }
}
