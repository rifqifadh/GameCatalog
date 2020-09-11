//
//  EditProfileView.swift
//  Games Catalog
//
//  Created by Rifqi Fadhlillah on 01/08/20.
//

import SwiftUI

struct EditProfileView: View {
	@Environment(\.presentationMode) var presentationMode
	@ObservedObject var profileViewModel = ProfileViewModel()
	
	@State private var showUpdateProfile = false
	
	var body: some View {
		NavigationView {
			Form {
				
				Section(header: Text("Name")) {
					TextField("Enter your name", text: $profileViewModel.profile.name)
				}
				Section(header: Text("Email")) {
					TextField("Enter your email", text: $profileViewModel.profile.email)
				}
				Section(header: Text("About")) {
					TextField("Describe your self", text: $profileViewModel.profile.about)
				}
				
				Section(header: Text("Social Media Account")) {
					TextField("Enter your LinkedIn account", text: $profileViewModel.profile.linkedIn)
					TextField("Enter your Github account", text: $profileViewModel.profile.github)
				}
				Section {
					Button(action: {
						self.showUpdateProfile = true
					}, label: {
						Text("Update")
					})
				}
			}
			.alert(isPresented: $showUpdateProfile) {
				Alert(title: Text("Update Profile"), message: Text("Are you sure want to update profile ?"), primaryButton: .destructive(Text("Yes")) {
					profileViewModel.save()
					presentationMode.wrappedValue.dismiss()
				}, secondaryButton: .cancel())
			}
			.navigationBarTitle("Edit Profile", displayMode: .inline)
		}
	}
}

struct EditProfileView_Previews: PreviewProvider {
	static var previews: some View {
		EditProfileView()
			.preferredColorScheme(.dark)
	}
}
