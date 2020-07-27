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
            List {
                ForEach(games, id: \.self) { game in
                    Text("Hello, \(game.name!)")
                }.onDelete(perform: removeGames)
            }
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
