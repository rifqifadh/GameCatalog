//
//  EditProfileView.swift
//  Games Catalog
//
//  Created by Rifqi Fadhlillah on 01/08/20.
//

import SwiftUI

enum Profile {
    static let name = "name"
    static let email = "email"
    static let about = "about"
    static let linkedin = "linkedin"
    static let github = "github"
    static let twitter = "twitter"
}

struct EditProfileView: View {
    @AppStorage(Profile.name) var name: String = ""
    @AppStorage(Profile.email) var email: String = ""
    @AppStorage(Profile.about) var about: String = ""
    @AppStorage(Profile.linkedin) var linkedin: String = ""
    @AppStorage(Profile.github) var github: String = ""
    @AppStorage(Profile.twitter) var twitter: String = ""
    var body: some View {
            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                    VStack {
                        TextInputView(label: "Name", placeholder: "Enter your name", value: $name)
                        TextInputView(label: "Email", placeholder: "Enter your email", value: $email)
                        TextInputView(label: "About", placeholder: "Describe your self", value: $about)
                        TextInputView(label: "LinkedIn", placeholder: "Enter your LinkedIn account", value: $linkedin)
                        TextInputView(label: "Github", placeholder: "Enter your Github account", value: $github)
                        TextInputView(label: "Twitter", placeholder: "Enter your Twitter account", value: $twitter)
                    }.padding(.horizontal)
                }.padding()
            }
            .onAppear(perform: {
                
            })
            .navigationBarTitle("Edit Profile", displayMode: .inline)
            .background(Color("Background"))
        }
}

