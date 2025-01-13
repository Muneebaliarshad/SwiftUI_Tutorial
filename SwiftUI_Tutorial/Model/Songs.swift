//
//  Songs.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 9/6/23.
//

import Foundation

struct Songs: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
    var artworkUrl100: String
}
