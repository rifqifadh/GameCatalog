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
	let backgroundImage: String?
	let released: String?
	let ratingsCount: Int?
	var releaseDate: String? {
		if let released = released {
			let formatter = DateFormatter()
			formatter.dateFormat = "yyyy-mm-dd"
			let date = formatter.date(from: released)!
			formatter.setLocalizedDateFormatFromTemplate("MMM dd, yyyy")
			return formatter.string(from: date)
		}
		return "Unknown"
	}
	let rating: Double?
	var ratingRoundFormat: Int {
		if let rating = rating {
			let ratingInt = Int(round(rating))
			return ratingInt
		}
		return 0
	}

	let metacritic: Int?
	var metacriticShape: Color {
		if let metacritic = metacritic {
			switch metacritic {
			case 0..<30:
				return Color.red
			case 31..<50:
				return Color.yellow
			case 51..<70:
				return Color.orange
			case 71...90:
				return Color.green
			case 91...100:
				return Color.blue
			default:
				return Color.red
			}
		}
		return Color.red
	}
	var genres: [Genres]?
	var genre: String {
		if let genres = genres {
			return genres.map { String($0.name) }.joined(separator: ", ")
		}
		return "-"
	}
	let platforms: [Platforms]?
	
	var platform: String {
		if let platforms = platforms {
			return platforms.map { String($0.platform.name) }.joined(separator: ",")
		}
		return "Unknown"
	}
	
	let developers: [Developers]?
	var developer: String {
		if let developers = developers {
			return developers.map { String($0.name) }.joined(separator: ",")
		}
		return "Unknown"
	}
	
	let publishers: [Publishers]?
	var publisher: String {
		if let publishers = publishers {
			return publishers.map { String($0.name) }.joined(separator: ",")
		}
		return "Unknown"
	}
	let clip: Clip?
}
