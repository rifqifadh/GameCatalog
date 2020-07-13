//
//  Games.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 01/07/20.
//

import SwiftUI

struct GamesResponse: Codable {
    let count: Int
    let results: [Games]
}

struct Games: Codable, Identifiable {
    var id: Int?
    let name: String
    let descriptionRaw: String?
    let released: String?
    var releaseDate: String? {
        guard let released = released else { return nil }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-mm-dd"
        let date = formatter.date(from: released)!
        formatter.setLocalizedDateFormatFromTemplate("MMM dd, yyyy")
        return formatter.string(from: date)
    }
    let backgroundImage: String?
    let metacritic: Int?
    var genres: [Genres]?
    var genre: String {
        if let genres = genres {
            return genres.map { String($0.name) }.joined(separator: ", ")
        }
        return "-"
    }
    
    var metacriticShape: Color {
        guard let metacritic = metacritic else {
            return Color.gray.opacity(0)
        }
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

    
    struct Clip: Codable {
        let clip: String
        let preview: String
    }
    
}
let static_games = Games(id: 3498,
                         name: "Grand Theft Auto V",
                         descriptionRaw: "Rockstar Games went bigger, since their previous installment of the series. You get the complicated and realistic world-building from Liberty City of GTA4 in the setting of lively and diverse Los Santos, from an old fan favorite GTA San Andreas. 561 different vehicles (including every transport you can operate) and the amount is rising with every update.",
                         released: "2013-09-17",
                         backgroundImage: "https://media.rawg.io/media/games/b11/b115b2bc6a5957a917bc7601f4abdda2.jpg",
                         metacritic: 97,
                         genres: [static_genres])


let static_genres = Genres(name: "Advanture")
let static_clip = Games.Clip(clip: "https://media.rawg.io/media/stories-640/5b0/5b0cfff8c606c5e4db4f74f108c4413b.mp4", preview: "https://media.rawg.io/media/stories-previews/f65/f6593df6c8df32c7f4763f9cb112a514.jpg")

