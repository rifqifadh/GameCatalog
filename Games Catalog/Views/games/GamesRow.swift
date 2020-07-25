//
//  GamesRow.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 01/07/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct GamesRow: View {
    
    var games: Games
    
    var body: some View {
        VStack() {
            ZStack(alignment: .bottomLeading) {
                WebImage(url: URL(string: games.backgroundImage!))
                    .resizable()
                    .renderingMode(.original)
                    .placeholder {
                        Rectangle().foregroundColor(.gray)}
                    .indicator(.activity)
                    .frame(height: 240)
                ZStack {
                    BlurView(style: .light)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 70)
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text("\(games.name)!")
                                .font(.title)
                                .fontWeight(.bold)
                                .lineLimit(1)
                                .foregroundColor(Color("Background"))
                            Text("\(games.genre)")
                                .font(.caption2)
                                .foregroundColor(Color("Background"))
                        }
                        Spacer()
                        if let metacritic = games.metacritic {
                            ScoreBox(color: games.metacriticShape, score: String("\(metacritic)"))
                                .frame(alignment: .topLeading)
                        }
                    }
                    .padding(10.0)
                    .frame(minWidth: 0,
                           maxWidth: .infinity,
                           alignment: .leading)
                }
            }
        }
    }
}

struct GamesRow_Previews: PreviewProvider {
    static var previews: some View {
        GamesRow(games: static_games)
        
    }
}
