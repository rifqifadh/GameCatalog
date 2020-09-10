//
//  GamesView.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 01/07/20.
//

import SwiftUI
import SDWebImageSwiftUI

enum FilterType: String {
	case relevance = "Relevance"
	case dateAdded = "Date Added"
	case releaseDate = "Release Date"
	case rating = "Rating"
}

struct GamesView: View {
	@ObservedObject var viewModel = GameViewModel()
	
	@State private var showFilter = false
	@State private var filterBy = FilterType.relevance
	@State private var selectedOption = 0
	
	var body: some View {
		NavigationView {
			VStack {
				if viewModel.loadingState == .loading {
					ProgressViewCustom()
				} else if viewModel.loadingState == .failed {
					EmptyStateView()
				} else {
					GameListView(games: viewModel.games)
				}
			}
			.navigationBarTitle(Text("Games Catalog"))
			.navigationBarItems(trailing: Button(action: {
				self.showFilter = true
			}){
				Text(filterBy.rawValue)
					.frame(alignment: .trailing)
				Image(systemName: "arrow.up.arrow.down.circle")
			})
			.actionSheet(isPresented: $showFilter) {
				ActionSheet(title: Text("Select Ordering"), buttons: [
					.default(Text("Relevance")) {
						self.filterBy = .relevance
						viewModel.fetchGames() },
					.default(Text("Date added")) {
						self.filterBy = .dateAdded
						viewModel.fetchGames(["ordering": "-added"]) },
					.default(Text("Release date")) {
						self.filterBy = .releaseDate
						viewModel.fetchGames(["ordering": "-released"]) },
					.default(Text("Rating")) {
						self.filterBy = .rating
						viewModel.fetchGames(["ordering": "-rating"]) },
					.cancel()
				])
			}
			.alert(isPresented: $viewModel.loadFailed) {
				Alert(title: Text("Turn off Airplane Mode or Use Wi-Fi to Access Data "), primaryButton: .default(Text("Settings"), action: {
					UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
				}), secondaryButton: .default(Text("OK")))
			}
		}
	}
	
	func navigateToSetting() {
		
	}
}

struct GamesView_Previews: PreviewProvider {
	static var previews: some View {
		GamesView()
	}
}
