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
            VStack(alignment: .leading) {
                WebImage(url: URL(string: games.backgroundImage!))
                    .resizable()
                    .renderingMode(.original)
                    .background(Color.gray.opacity(0.5))
                    .frame(height: 200)
                HStack {
                    Text("Release Date: \(games.releaseDate ?? "Error")")
                        .font(.caption2)
                        .foregroundColor(Color("Text"))
                    Spacer()
                    if let metacritic = games.metacritic {
                        ScoreBox(color: games.metacriticShape, score: String("\(metacritic)"))
                            .frame(alignment: .topLeading)
                    }
                }
                .padding([.top, .leading, .trailing], 10.0)
                VStack(alignment: .leading) {
                    Text("\(games.name)!")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Text"))
                    Text("\(games.genre)")
                        .font(.caption2)
                        .foregroundColor(Color("Text"))
                }
                .padding([.bottom, .leading, .trailing], 10.0)
            }
            .background(Color("PrimaryVariant"))
        }
    }
}

struct GamesRow_Previews: PreviewProvider {
    static var previews: some View {
        GamesRow(games: static_games)
        
    }
}
