//
//  ProgressView.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 25/07/20.
//

import SwiftUI

struct ProgressViewCustom: View {
    
    var body: some View {
        VStack {
            ProgressView(String("Loading..."))
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .foregroundColor(.blue)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(Color("Background"))
    }
}

struct ProgressViewCustom_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
