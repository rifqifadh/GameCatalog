//
//  TextInputView.swift
//  Games Catalog
//
//  Created by Rifqi Fadhlillah on 05/08/20.
//

import SwiftUI

struct TextInputView: View {
    var label: String = ""
    var placeholder: String = ""
    @Binding var value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
            TextField(placeholder, text: $value)
                .cornerRadius(5)
                .padding(10)
                .background(Color.white)
        }
    }
}

struct TextInputView_Previews: PreviewProvider {
    static var previews: some View {
        TextInputView(label: "Name", placeholder: "Enter Your Name", value: .constant("Value"))
    }
}
