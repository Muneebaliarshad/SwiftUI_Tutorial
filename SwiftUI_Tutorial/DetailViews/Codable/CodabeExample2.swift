//
//  CodabeExample2.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 2/12/24.
//

import SwiftUI

struct CodabeExample2: View {
    var body: some View {
        Button("Encode Data", action: encodeData)
    }

    func encodeData() {
        let data = try! JSONEncoder().encode(UserModel2())
        let stringData = String(decoding: data, as: UTF8.self)
        print(stringData)
    }
}

#Preview {
    CodabeExample2()
}
