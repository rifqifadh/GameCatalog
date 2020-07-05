//
//  DetailGame.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 04/07/20.
//

import SwiftUI

struct DetailGame: Codable {
    let id: Int
    let name: String
    let descriptionRaw: String?
    let backgroundImage: String
    let released: String?
    var releaseDate: String? {
        guard let released = released else { return nil }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-mm-dd"
        let date = formatter.date(from: released)!
        formatter.setLocalizedDateFormatFromTemplate("MMM dd, yyyy")
        return formatter.string(from: date)
    }
    let rating: Double?
    let metacritic: Int
    var metacriticShape: Color {
        switch metacritic {
            case 0..<20:
                return Color.red
            case 21..<40:
                return Color.yellow
            case 41..<60:
                return Color.orange
            case 71...90:
                return Color.green
            case 91...100:
                return Color.blue
            default:
                return Color.gray.opacity(0)
        }
    }
    var genres: [Genres]
    var genre: String {
        let joined = genres.map { String($0.name) }.joined(separator: ", ")
        return joined
    }
    let platforms: [Platforms]?

    var platform: String {
        if let platforms = platforms {
            return platforms.map { String($0.platform.name) }.joined(separator: ",")
        }
        return "-"
    }
    
    let developers: [Developers]?
    var developer: String {
        if let developers = developers {
            return developers.map { String($0.name) }.joined(separator: ",")
        }
        return "-"
    }
    
    let publishers: [Publishers]?
    var publisher: String {
        if let publishers = publishers {
            return publishers.map { String($0.name) }.joined(separator: ",")
        }
        return "-"
    }
}
