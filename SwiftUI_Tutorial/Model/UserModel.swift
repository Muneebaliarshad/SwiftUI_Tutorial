//
//  UserModel.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 1/17/24.
//

import Foundation
import SwiftData

@Model  
class UserModel {
    var name: String
    var city: String
    var joinDate: Date

    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}


@Observable
class UserModel2: Codable {
    var name = "Seven Peaks"
}
