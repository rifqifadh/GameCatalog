//
//  Platforms.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 05/07/20.
//

import Foundation

struct Platforms: Codable {
    let platform: Platform
    
    struct Platform: Codable {
        let id: Int
        let name: String
    }
}
