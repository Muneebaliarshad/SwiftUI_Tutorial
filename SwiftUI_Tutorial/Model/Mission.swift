//
//  Mission.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 8/11/23.
//

import Foundation

struct Mission: Codable, Identifiable {
    var id: Int?
    var launchDate: Date?
    var crew: [CrewRole]?
    var description: String?
    var displayName: String? {
        return "Appllo \(id ?? 0)"
    }
    var image: String? {
        return "apollo\(id ?? 0)"
    }
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}

struct CrewRole: Codable {
    var name: String?
    var role: String?
}
