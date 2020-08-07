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
                    }
            }
            .onAppear(perform: setupAppearance)
        }
    }
    
    private func setupAppearance() {
        
//        UINavigationBar.appearance().largeTitleTextAttributes = [
//            NSAttributedString.Key.foregroundColor: UIColor(named: "Text")!
//        ]
//
//        UINavigationBar.appearance().titleTextAttributes = [
//            NSAttributedString.Key.foregroundColor: UIColor(named: "Text")!
//        ]
        
        UINavigationBar.appearance().isTranslucent = true
//
        UINavigationBar.appearance().barTintColor = UIColor(named: "Background")
        UINavigationBar.appearance().backgroundColor = UIColor(named: "Background")
//        UINavigationBar.appearance().tintColor = UIColor(named: "Text")
//
        UITableView.appearance().backgroundColor = UIColor(named: "Background")
        UITableViewCell.appearance().backgroundColor = UIColor(named: "Background")
//
//        UIScrollView.appearance().backgroundColor = UIColor(named: "Background")
//
        UITabBar.appearance().isTranslucent = true
//        UITabBar.appearance().unselectedItemTintColor = UIColor(named: "Text")
//        UITabBar.appearance().barTintColor = UIColor(named: "BackgroundInactive")
        
    }
}
