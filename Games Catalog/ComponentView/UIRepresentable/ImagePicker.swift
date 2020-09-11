//
//  ImagePicker.swift
//  Games Catalog
//
//  Created by Rifqi Fadhlillah on 09/09/20.
//

import Foundation
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
	
	@Environment(\.presentationMode) var presentationMode
	@Binding var image: UIImage?
	
	func makeUIViewController(context: Context) -> some UIViewController {
		let picker = UIImagePickerController()
		picker.delegate = context.coordinator
		return picker
	}
	
	func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
		
	}
	
	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}
	
	class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
		let parent: ImagePicker
		
		init(_ parent: ImagePicker) {
			self.parent = parent
		}
		
		func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
			if let uiImage = info[.originalImage] as? UIImage {
				parent.image = uiImage
			}
			
			parent.presentationMode.wrappedValue.dismiss()
		}
	}
}
