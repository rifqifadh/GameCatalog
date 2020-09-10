//
//  Games_CatalogApp.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 01/07/20.
//

import SwiftUI

@main
struct GamesCatalogApp: App {
   let context = PersistentContainer.persistentContainer.viewContext
   @State var selectedView = 0
   
   @SceneBuilder
   var body: some Scene {
      WindowGroup {
         TabView(selection: $selectedView) {
            GamesView()
               .environment(\.managedObjectContext, context)
               .tabItem {
                  Image(systemName: "gamecontroller")
                  Text("Games")
               }.tag(0)
            FavoriteView()
               .environment(\.managedObjectContext, context)
               .tabItem {
                  Image(systemName: "heart")
                  Text("Favorites")
               }.tag(1)
            SearchGameView()
               .environment(\.managedObjectContext, context)
               .tabItem {
                  Image(systemName: "magnifyingglass")
                  Text("Search")
               }.tag(2)
            About()
               .tabItem {
                  Image(systemName: "person.circle")
                  Text("Profile")
					}.tag(3)
         }
      }
   }
}
