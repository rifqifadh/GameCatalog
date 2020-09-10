//
//  Profile.swift
//  Games Catalog
//
//  Created by Rifqi Fadhlillah on 09/09/20.
//

import Foundation
import SwiftUI

struct ProfileModel: Identifiable, Codable {
	
	var id = UUID()
	var name = "Rifqi"
	var email = "rifqifadh@gmail.com"
	var about = "i'm iOS Developer"
	var linkedIn = "linkedin.com/rifqi-fadh"
	var github = "github.com/rifqifadh"
	
}

class ProfileViewModel: ObservableObject {
	@Published var profile: ProfileModel
	
	static let saveKey = "SavedData"
	
	init() {
		if let data = UserDefaults.standard.data(forKey: Self.saveKey) {
			if let decoded = try? JSONDecoder().decode(ProfileModel.self, from: data) {
				self.profile = decoded
				return
			}
		}
		self.profile = ProfileModel()
	}
	
	func save() {
		if let encoded = try? JSONEncoder().encode(profile) {
			UserDefaults.standard.set(encoded, forKey: Self.saveKey)
		}
	}
	
	func loadData() {
		if let data = UserDefaults.standard.data(forKey: Self.saveKey) {
			if let decoded = try? JSONDecoder().decode(ProfileModel.self, from: data) {
				self.profile = decoded
			}
		}
	}
}
