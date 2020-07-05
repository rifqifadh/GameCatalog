//
//  Games_CatalogApp.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 01/07/20.
//

import SwiftUI

@main
struct GamesCatalogApp: App {
    @State var selectedView = 0
    
    @SceneBuilder
    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedView) {
                GamesView()
                    .tabItem {
                        Image(systemName: "gamecontroller")
                        Text("Games")
                    }.tag(0)
                    .onAppear(perform: setupAppearance)
                
                SearchGameView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }.tag(1)
            }
        }
    }
    
    private func setupAppearance() {
        
        UINavigationBar.appearance().largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(named: "Text")!
        ]
        
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(named: "Text")!
        ]
        
        UINavigationBar.appearance().isTranslucent = true

        UINavigationBar.appearance().barTintColor = UIColor(named: "Primary")
        UINavigationBar.appearance().backgroundColor = UIColor(named: "Primary")
        UINavigationBar.appearance().tintColor = UIColor(named: "Text")

        UITableView.appearance().backgroundColor = UIColor(named: "Primary")
        UITableViewCell.appearance().backgroundColor = UIColor(named: "Primary")
        
        UIScrollView.appearance().backgroundColor = UIColor(named: "Primary")
        
//        UITabBar.appearance().unselectedItemTintColor = UIColor(named: "TabLabel")
//        UITabBar.appearance().barTintColor = UIColor(named: "ACTabBarTint")
//        UITabBar.appearance().backgroundColor = UIColor(named: "ACTabBarTint")
        
    }
}
