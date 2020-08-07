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
            WebImage(url: URL(string: game.backgroundImage ?? "")!)
                .resizable()
                .placeholder {
                    Rectangle().foregroundColor(.gray)}
                .indicator(.activity)
                .cornerRadius(10)
                .frame(width: 140, height: 90)
            VStack(alignment: .leading) {
                Text("\(game.name ?? "")")
                    .fontWeight(.semibold)
                    .font(.title3)
                    .lineLimit(2)
                    .foregroundColor(Color("Text"))
                Text("\(game.genre ?? "")")
                    .fontWeight(.thin)
                    .font(.subheadline)
                    .foregroundColor(Color("TextInactive"))
                Text("⭐️ \(String(format: "%.1f", game.rating ))/5")
                    .font(.footnote)
                    .foregroundColor(Color("TextInactive"))
                    .padding(.top, 5)
            }
        }
    }
}

