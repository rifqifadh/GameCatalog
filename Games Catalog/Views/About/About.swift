//
//  ContentView.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 01/07/20.
//

import SwiftUI
import Combine

enum ActiveSheet {
	case editProfile, editPhoto
}

struct About: View {
	
	@Environment(\.presentationMode) var presentationMode
   
	@ObservedObject var profileViewModel = ProfileViewModel()
	
	@State private var showSheet = false
	@State private var inputImage: UIImage?
	@State private var profileImage: Image?
	@State private var activeSheet = ActiveSheet.editProfile

	
   private func getScrollOffset(_ geometry: GeometryProxy) -> CGFloat {
      geometry.frame(in: .global).minY
   }
   
   private func getOffsetForHeaderImage(_ geometry: GeometryProxy) -> CGFloat {
      let offset = getScrollOffset(geometry)
      
      // Image was pulled down
      if offset > 0 {
         return -offset
      }
      return 0
   }
   
   private func getHeightForHeaderImage(_ geometry: GeometryProxy) -> CGFloat {
      let offset = getScrollOffset(geometry)
      let imageHeight = geometry.size.height
      
      if offset > 0 {
         return imageHeight + offset
      }
      
      return imageHeight
   }
   
   private func getBlurRadiusForImage(_ geometry: GeometryProxy) -> CGFloat {
      let offset = geometry.frame(in: .global).maxY
      
      let height = geometry.size.height
      let blur = (height - max(offset, 0)) / height
      
      return blur * 6
   }
   
   var body: some View {
      NavigationView {
			ScrollView(.vertical) {
            GeometryReader { geometry in
					ZStack(alignment: .center) {
						Image("background")
							.resizable()
							.scaledToFill()
							.frame(width: geometry.size.width, height: self.getHeightForHeaderImage(geometry))
							.blur(radius: self.getBlurRadiusForImage(geometry))
							.clipped()
							.offset(x: 0, y: self.getOffsetForHeaderImage(geometry))
						
						HStack(alignment: .center) {
							ZStack(alignment: .bottomTrailing) {
							if profileImage != nil {
									profileImage?
										.resizable()
										.scaledToFill()
	//									.overlay(Circle().stroke(Color.gray,lineWidth: 8))
										.frame(width: 100, height: 100)
										.clipShape(Circle())
										.clipped()
										.shadow(radius: 4)
										.padding()
								} else {
									Image("photo")
										.resizable()
										.scaledToFill()
	//									.overlay(Circle().stroke(Color.gray,lineWidth: 8))
										.frame(width: 100, height: 100)
										.clipShape(Circle())
										.clipped()
										.shadow(radius: 4)
										.padding()
								}

								Button(action: {
									self.showSheet = true
									self.activeSheet = .editPhoto
								}) {
									Image(systemName: "pencil")
										.font(.caption2)
										.clipped()
										.padding(.all, 5)
										.background(Color.white)
										.clipShape(Circle())
										.frame(width: 64, height: 64)
								}
							}
						}
					}
            }.frame(height: 300)
				
				HStack(alignment: .top) {
					VStack(alignment: .leading, spacing: 10) {
						VStack(alignment: .leading, spacing: 5) {
							Text(profileViewModel.profile.name)
								.font(.avenirNext(size: 22))
							Text(profileViewModel.profile.email)
								.font(.avenirNext(size: 14))
								.foregroundColor(.gray)
						}
						VStack(alignment: .leading) {
							Text("About")
								.font(.avenirNext(size: 14))
							Text(profileViewModel.profile.about)
								.font(.avenirNextRegular(size: 12))
							
							HStack(alignment: .center) {
								Image("linkedin_icon")
									.resizable()
									.background(Color.white)
									.frame(width: 16, height: 16)
								Text("LinkedIn")
									.font(.avenirNext(size: 14))
							}
							Text(profileViewModel.profile.linkedIn)
								.font(.avenirNextRegular(size: 14))
								.foregroundColor(.blue)
							
							HStack(alignment: .center) {
								Image("github_icon")
									.resizable()
									.background(Color.white)
									.frame(width: 16, height: 16)
								Text("Github")
									.font(.avenirNext(size: 14))
							}
							Text(profileViewModel.profile.github)
								.font(.avenirNextRegular(size: 14))
								.foregroundColor(.blue)
						}
						.padding(.vertical)
					}
					.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
					.padding(.horizontal)
					
					Spacer()
					
					Button(action: {
						self.showSheet = true
						self.activeSheet = .editProfile
					}) {
						Text("Edit")
							.padding(.horizontal, 20)
							.padding(.vertical, 5)
							.background(Color("Background"))
							.clipShape(
								Rectangle()
							)
							.cornerRadius(5)
					}
					.padding(.trailing, 10)
				}
         }
         .edgesIgnoringSafeArea(.all)
         .navigationBarHidden(true)
         .navigationBarBackButtonHidden(true)
			.sheet(isPresented: $showSheet, onDismiss: self.activeSheet == .editProfile  ? profileViewModel.loadData : loadImage) {
				if self.activeSheet == .editProfile {
					EditProfileView()
				} else {
					ImagePicker(image: self.$inputImage)
				}
			}
//			.sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
//				ImagePicker(image: self.$inputImage)
//			}
      }
   }
	
	func loadImage() {
		guard let inputimage = inputImage else { return }
		profileImage = Image(uiImage: inputimage)
	}
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      About()
   }
}
