//
//  FavoriteGameRow.swift
//  Games Catalog
//
//  Created by Rifqi Fadhlillah on 27/07/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavoriteGameRow: View {
	
	var game: Favorite
	
	var body: some View {
		HStack(alignment: .top) {
			WebImage(url: URL(string: game.backgroundImage ?? ""))
				.resizable()
				.placeholder {
					Rectangle().foregroundColor(.gray)}
				.indicator(.activity)
				.cornerRadius(10)
				.frame(width: 140, height: 90)
			VStack(alignment: .leading, spacing: 5) {
				Text("\(game.name ?? "")")
					.fontWeight(.semibold)
					.font(.title3)
					.lineLimit(2)
					.foregroundColor(Color.primary)
				Text("\(game.genre ?? "")")
					.font(.subheadline)
					.foregroundColor(Color.primary)
				RatingView(rating: .constant(Int(game.rating)), spacing: 3)
					.font(.caption)
			}
		}
	}
}

