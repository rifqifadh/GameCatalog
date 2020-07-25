//
//  SectionHeaderView.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 25/07/20.
//

import SwiftUI

struct SectionHeaderView: View {
    
    let text: String?
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        HStack {
            Text("Hello, World!")            
        }
    }
}

struct SectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeaderView(text: "Previews")
    }
}
