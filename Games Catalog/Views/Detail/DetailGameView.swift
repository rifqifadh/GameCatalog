//
//  DetailView.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 03/07/20.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI
import AVKit

struct DetailGameView: View {
	@Environment(\.managedObjectContext) var moc
	@ObservedObject private var detailViewModel: DetailViewModel
	@State private var showConfirmation = false
	
	var fetchRequest: FetchRequest<Favorite>
	
	var games: FetchedResults<Favorite> { fetchRequest.wrappedValue }
	
	init(id: Int) {
		self._detailViewModel = ObservedObject(wrappedValue: DetailViewModel(id: id))
		self.fetchRequest = FetchRequest<Favorite>(entity: Favorite.entity(), sortDescriptors: [],
																 predicate: NSPredicate(format: "id == \(id)"))
	}
	
	var body: some View {
		ScrollView(.vertical) {
			if detailViewModel.loadingState == .loading {
				ProgressViewCustom()
			} else {
				VStack(alignment: .leading) {
					if let url = URL(string: detailViewModel.detailGames?.clip?.clip ?? "") {
						VideoPlayer(player: AVPlayer(url: url))
							.frame(height: 280)
					} else {
						WebImage(url: URL(string: detailViewModel.detailGames?.backgroundImage ?? ""))
							.resizable()
							.renderingMode(.original)
							.placeholder {
								Rectangle().foregroundColor(.gray)}
							.indicator(.activity)
							.frame(height: 200)
					}
					DetailContentView(game: detailViewModel.detailGames!)
						.padding([.top, .leading, .trailing])
					Divider()
					VStack(alignment: .leading) {
						Text("Screenshots")
							.font(.headline)
							.padding(.leading)
						ScrollView(.horizontal, showsIndicators: false) {
							HStack {
								if let screenshot = detailViewModel.screenshots {
									ForEach(screenshot) { value in
										WebImage(url: URL(string: value.image))
											.resizable()
											.placeholder {
												Rectangle().foregroundColor(.gray)}
											.indicator(.activity)
											.cornerRadius(10)
											.scaledToFill()
											.frame(width: 240, height: 135)
											.padding(.horizontal, 5)
									}
									.edgesIgnoringSafeArea(.all)
								}
							}
						}
					}
					.padding(.bottom, 20)
					.frame(alignment: .center)
					.background(Color("Background"))
					.navigationBarItems(
						trailing:
							Button(action: {
								if detailViewModel.isFav {
									self.showConfirmation = true
								} else {
									detailViewModel.saveToFavorite(moc)
								}
							}) {
								Image(systemName: detailViewModel.isFav ? "heart.fill" : "heart")
									.foregroundColor(.red)
							}
					)
					.navigationBarTitle(Text("\(detailViewModel.detailGames!.name)"), displayMode: .inline)
				}
			}
		}
		.onAppear {
			detailViewModel.getDetailMovie()
			detailViewModel.checkIsFav(games)
		}
		.alert(isPresented: $showConfirmation) {
			Alert(title: Text("Are you sure want to delete \(detailViewModel.detailGames?.name ?? "this game") from favorite?"), primaryButton: .cancel(Text("Cancel")), secondaryButton: .destructive(Text("Delete"), action: { detailViewModel.deleteFav(from: games, context: moc)}))
		}
		.background(Color("Background"))
	}
}
