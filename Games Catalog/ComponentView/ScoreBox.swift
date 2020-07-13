//
//  ScoreBox.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 01/07/20.
//

import SwiftUI

struct ScoreBox: View {
    
    let color: Color
    var score: String
    
    var body: some View {
        VStack {
            Text("\(score)")
                .font(.caption2)
                .fontWeight(.heavy)
                .foregroundColor(color)
        }
        .padding(5)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(color, lineWidth: 3)
        )
    }
}

struct ScoreBox_Previews: PreviewProvider {
    static var previews: some View {
        ScoreBox(color: .blue,score: String("80"))
            .previewLayout(.sizeThatFits)
            
    }
}
