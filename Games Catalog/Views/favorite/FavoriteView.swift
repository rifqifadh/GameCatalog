//
//  FavoriteView.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 26/07/20.
//

import SwiftUI

struct FavoriteView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Favorite.entity(), sortDescriptors: []) var games: FetchedResults<Favorite>
    
    var body: some View {
        NavigationView {
            VStack {
                if games.isEmpty {
                    Image("empty_state")
                        .resizable()
                        .frame(width: 250, height: 250)
                    Text("Oh Crap, you've got nothing")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Text"))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                } else {
                    List {
                        ForEach(games, id: \.self) { game in
                            NavigationLink(destination: DetailGameView(id: Int(game.id))) {
                                FavoriteGameRow(game: game)
                            }
                        }.onDelete(perform: removeGames)
                        .listRowBackground(Color("Background"))
                        .padding(.vertical, 10)
                    }
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color("Background"))
            .navigationBarTitle(Text("Favorites"))
        }
    }
    
    func removeGames(at offset: IndexSet) {
        for index in offset {
            let game = games[index]
            moc.delete(game)
            do {
                try moc.save()
            } catch {
                fatalError("Error Deleting Favorite")
            }
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
