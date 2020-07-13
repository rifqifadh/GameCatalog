//
//  ContentView.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 01/07/20.
//

import SwiftUI

struct About: View {
    var body: some View {
        VStack() {
            Image("photo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .background(Color("Secondary"))
                .overlay(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color("Secondary"), lineWidth: 10)
                )
            VStack(alignment: .leading) {
                List {
                    Text("Rifqi Fadhlillah")
                    VStack(alignment: .leading) {
                        Text("About Me").padding(.bottom)
                        Text("Hello, im an iOS Engineer 👨🏽‍💻")
                    }
                    HStack {
                        Text("LinkedIn : ")
                        Text("https://www.linkedin.com/in/rifqi-fadh/")
                    }
                    HStack {
                        Text("Github: ")
                        Text("https://github.com/rifqifadh")
                    }
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
