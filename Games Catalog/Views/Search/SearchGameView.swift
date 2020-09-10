//
//  SearchGameView.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 05/07/20.
//

import SwiftUI

struct SearchGameView: View {
	
	@StateObject var viewModel = SearchViewModel()
	
	var body: some View {
		NavigationView {
			VStack {
				List {
					Section(header: SearchField(searchText: $viewModel.searchText, placeholder: "Search a Game")) {
						if viewModel.loadingState == .loading {
							ProgressViewCustom()
								.frame(minHeight: 0, maxHeight: .infinity)
						} else if viewModel.loadingState == .failed {
							EmptyStateView()
						} else {
							if viewModel.searchText.isEmpty {
								ForEach(viewModel.searchGame) { game in
									NavigationLink(destination: DetailGameView(id: game.id)) {
										Text("\(game.name)")
									}
								}
							} else {
								if viewModel.searchGame.isEmpty {
									EmptyStateView()
								} else {
									ForEach(viewModel.searchGame) { game in
										NavigationLink(destination: DetailGameView(id: game.id)) {
											Text("\(game.name)")
										}
									}
								}
							}
						}
					}
					.listRowBackground(Color("Background"))
				}
			}
			.listStyle(InsetGroupedListStyle())
			.navigationBarTitle(Text("Search"))
			.alert(isPresented: $viewModel.loadFailed) {
				Alert(title: Text("Turn off Airplane Mode or Use Wi-Fi to Access Data "), primaryButton: .default(Text("Settings"), action: {
					UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
				}), secondaryButton: .default(Text("OK")))
			}
		}
	}
}

struct SearchGameView_Previews: PreviewProvider {
	static var previews: some View {
		SearchGameView()
	}
}
