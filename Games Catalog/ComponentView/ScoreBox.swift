//
//  ScoreBox.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 01/07/20.
//

import SwiftUI

struct ScoreBox: View {
	
	var color: Color
	var score: String
	
	var body: some View {
		HStack(alignment: .center) {
			Text(score)
				.fontWeight(.bold)
				.font(.footnote)
				.foregroundColor(color)
		}
		.padding(5)
		.frame(width: 30, height: 30)
		.overlay(
			RoundedRectangle(cornerRadius: 8)
				.stroke(color, lineWidth: 4)
		)
	}
}

struct ScoreBox_Previews: PreviewProvider {
	static var previews: some View {
		ScoreBox(color: .blue,score: String("80"))
			.previewLayout(.sizeThatFits)
		
	}
}
