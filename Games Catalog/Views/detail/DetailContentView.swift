//
//  DetailContentView.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 04/07/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailContentView: View {
    
    @State var moreDesc: Bool = false
    
    var game: DetailGame
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(game.name)")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack(alignment: .center) {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("\(String(format: "%.1f", game.rating ?? 0))/5")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.yellow)
            }
                .padding(.bottom, 20)
            Text("Description")
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.bottom, 5)
            description
            Divider()
            detailGame
        }
    }
}

extension DetailContentView {
    private var description: some View {
        VStack {
            if moreDesc {
                Text("\(game.descriptionRaw ?? "")")
                    .font(.body)
            } else {
                Button(action: {
                    self.moreDesc.toggle()
                }, label: {
                    VStack(alignment: .leading) {
                        Text("\(game.descriptionRaw ?? "")")
                            .font(.body)
                            .lineLimit(4)
                            .foregroundColor(Color("Text"))
                        Text("Read more")
                    }
                })
            }
        }
    }
    
    private var detailGame: some View {
        VStack(alignment: .leading) {
            Text("Genre")
                .font(.headline)
                .padding(.bottom, 5)
            Text("\(game.genre)")
            Divider()
            Text("Platform")
                .font(.headline)
                .padding(.bottom, 5)
            Text("\(game.platform)")
                .lineLimit(2)
            Divider()
            Text("Publisher")
                .font(.headline)
                .padding(.bottom, 5)
            Text("\(game.publisher)")
            Divider()
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Developer")
                        .font(.headline)
                        .padding(.bottom, 5)
                    Text("\(game.developer)")
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .padding(.bottom)
                    Text("Metacritic")
                        .font(.headline)
                        .padding(.bottom, 5)
                    ScoreBox(color: game.metacriticShape, score: String("\(game.metacritic)"))
                        .padding(.bottom)
                }
                Spacer()
                Spacer()
                VStack(alignment: .leading) {
                    Text("Release Date")
                        .font(.headline)
                        .padding(.bottom, 5)
                    Text("\(game.releaseDate ?? "-")")
                }
                Spacer()
            }
        }
    }
}

//struct DetailContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailContentView(game: static_games)
//    }
//}
