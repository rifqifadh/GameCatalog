//
//  RatingView.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 02/07/20.
//

import SwiftUI

struct RatingView: View {
	
	@Binding var rating: Int
	var spacing: CGFloat = 10
	
	var label = ""
	var maximumRating = 5
	
	var offImage: Image?
	var onImage = Image(systemName: "star.fill")
	
	var offColor = Color.gray
	var onColor = Color.yellow
	
	func image(for number: Int) -> Image {
		if number > rating {
			return offImage ?? onImage
		}
		else {
			return onImage
		}
	}
	
	var body: some View {
		
		HStack(spacing: spacing) {
			if label.isEmpty == false {
				Text(label)
			}
			
			ForEach(1..<maximumRating + 1) { number in
				self.image(for: number)
					.foregroundColor(number > self.rating ? self.offColor : self.onColor)
					.onTapGesture {
						self.rating = number
					}
			}
		}
	}
}

struct RatingView_Previews: PreviewProvider {
	static var previews: some View {
		RatingView(rating: .constant(5))
	}
}
