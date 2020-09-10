//
//  GamesRow.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 01/07/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct GameCard: View {
	
	let game: Game
	
	var body: some View {
		NavigationLink(destination: DetailGameView(id: game.id)) {
			VStack(alignment: .leading) {
				if game.backgroundImage != nil {
					WebImage(url: URL(string: game.backgroundImage!))
						.resizable()
						.renderingMode(.original)
						.placeholder {
							Rectangle().foregroundColor(.gray)}
						.indicator(.activity)
						.frame(height: 138)
				} else {
					Rectangle()
						.background(Color.gray)
						.cornerRadius(10)
						.frame(height: 138)
				}
				VStack(alignment: .leading, spacing: 5.0) {
					Text(game.name)
						.font(.subheadline)
						.fontWeight(.semibold)
						.lineLimit(2)
					RatingView(rating: .constant(game.ratingRoundFormat), spacing: 3)
						.font(.caption)
					Text(game.genre)
						.font(.caption)
						.foregroundColor(.secondary)
					Text("Release date: \(game.releaseDateFormatted)")
						.font(.caption)
						.foregroundColor(.secondary)
				}
				.padding(.all, 10)
			}
			.background(Color("CardBackground"))
			.cornerRadius(10)
			.shadow(radius: 5)
		}
		.buttonStyle(PlainButtonStyle())
	}
}

struct GameCard_Previews: PreviewProvider {
	
	static let list = [Game.game, Game.game, Game.game, Game.game, Game.game]
	static var columns: [GridItem] = [
		GridItem(.flexible()),
		GridItem(.flexible())
	]
	
	static var previews: some View {
		GameCard(game: Game.game)
			.previewLayout(.sizeThatFits)
	}
}
