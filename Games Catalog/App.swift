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
                
                SearchGameView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }.tag(1)
                
                About()
                    .tabItem {
                        Image(systemName: "info.circle")
                        Text("About")
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
        
//        UINavigationBar.appearance().isTranslucent = true
//
        UINavigationBar.appearance().barTintColor = UIColor(named: "Background")
        UINavigationBar.appearance().backgroundColor = UIColor(named: "Background")
//        UINavigationBar.appearance().tintColor = UIColor(named: "Text")
//
        UITableView.appearance().backgroundColor = UIColor(named: "Background")
        UITableViewCell.appearance().backgroundColor = UIColor(named: "Background")
//
        UIScrollView.appearance().backgroundColor = UIColor(named: "Background")
//
//        UITabBar.appearance().isTranslucent = true
//        UITabBar.appearance().unselectedItemTintColor = UIColor(named: "Text")
//        UITabBar.appearance().barTintColor = UIColor(named: "SecondaryVariant")
        
    }
}
