//
//  Screenshot.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 04/07/20.
//

struct ScreenshotResponse: Codable {
    var results: [Screenshot]
}
struct Screenshot: Codable, Identifiable {
    let id: Int
    let image: String
}
