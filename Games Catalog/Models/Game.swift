//
//  Game.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 01/07/20.
//

import SwiftUI

struct GamesResponse: Codable {
	let count: Int
	let results: [Game]
}

struct Game: Codable, Identifiable {
	var id: Int
	let name: String
	let descriptionRaw: String?
	let backgroundImage: String?
	let metacritic: Int?
	let released: String?
	var releaseDateFormatted: String {
		if let released = released {
			let formatter = DateFormatter()
			formatter.dateFormat = "yyyy-mm-dd"
			let date = formatter.date(from: released)!
			formatter.setLocalizedDateFormatFromTemplate("MMM dd, yyyy")
			return formatter.string(from: date)
		}
		return "Unknown"
	}
	var genres: [Genres]?
	var genre: String {
		if let genres = genres {
			return genres.map { String($0.name) }.joined(separator: ", ")
		}
		return "-"
	}
	let rating: Double?
	
	var ratingRoundFormat: Int {
		if let rating = rating {
			let ratingInt = Int(round(rating))
			return ratingInt
		}
		return 0
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
	
	static let game = Game(id: 12, name: "Grand Theft Auto V", descriptionRaw: "Desc", backgroundImage: "https://media.rawg.io/media/games/84d/84da2ac3fdfc6507807a1808595afb12.jpg", metacritic: 80, released: "2017-09-09", genres: [Genres.genre], rating: 5.0)
	
}
