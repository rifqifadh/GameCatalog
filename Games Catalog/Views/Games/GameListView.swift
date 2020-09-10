//
//  GameListView.swift
//  Games Catalog
//
//  Created by Rifqi Fadhlillah on 09/09/20.
//

import SwiftUI

struct GameListView: View {
	var games: [Game]
	
	var columns: [GridItem] = [
		GridItem(.flexible(), spacing: 15),
		GridItem(.flexible(), spacing: 15)
	]
	
	var body: some View {
		ScrollView(.vertical) {
			LazyVGrid(columns: columns,
						 alignment: .center,
						 spacing: 16) {
				ForEach(games, id: \.self.id) { game in
					GameCard(game: game)
				}
			}
			.padding(.horizontal, 20)
			.padding(.vertical, 10)
		}
	}
}
