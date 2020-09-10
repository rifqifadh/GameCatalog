//
//  EmptyView.swift
//  Games Catalog
//
//  Created by Rifqi Fadhlillah on 10/09/20.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
		VStack {
			Image("empty_state")
				.resizable()
				.frame(width: 250, height: 250)
			Text("Oh Crap, you've got nothing")
				.font(.largeTitle)
				.fontWeight(.bold)
				.foregroundColor(Color("Text"))
				.multilineTextAlignment(.center)
				.padding(.horizontal)
		}
		.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
