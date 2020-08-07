//
//  ContentView.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 01/07/20.
//

import SwiftUI

struct About: View {
    
    @AppStorage(Profile.name) var name: String = "-"
    @AppStorage(Profile.email) var email: String = "-"
    @AppStorage(Profile.about) var about: String = "-"
    @AppStorage(Profile.linkedin) var linkedin: String = "-"
    @AppStorage(Profile.github) var github: String = "-"
    @AppStorage(Profile.twitter) var twitter: String = "-"
    
    private func getScrollOffset(_ geometry: GeometryProxy) -> CGFloat {
        geometry.frame(in: .global).minY
    }
    
    private func getOffsetForHeaderImage(_ geometry: GeometryProxy) -> CGFloat {
        let offset = getScrollOffset(geometry)
        
        // Image was pulled down
        if offset > 0 {
            return -offset
        }
        return 0
    }
    
    private func getHeightForHeaderImage(_ geometry: GeometryProxy) -> CGFloat {
        let offset = getScrollOffset(geometry)
        let imageHeight = geometry.size.height
        
        if offset > 0 {
            return imageHeight + offset
        }
        
        return imageHeight
    }
    
    private func getBlurRadiusForImage(_ geometry: GeometryProxy) -> CGFloat {
        let offset = geometry.frame(in: .global).maxY
        
        let height = geometry.size.height
        let blur = (height - max(offset, 0)) / height
        
        return blur * 6
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                GeometryReader { geometry in
                    Image("background")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: self.getHeightForHeaderImage(geometry))
                        .blur(radius: self.getBlurRadiusForImage(geometry))
                        .clipped()
                        .offset(x: 0, y: self.getOffsetForHeaderImage(geometry))
                }.frame(height: 300)
                GeometryReader { geometry in
                    HStack(alignment: .top) {
                        Image("photo")
                            .resizable()
                            .scaledToFill()
                            .overlay(Circle().stroke(Color.gray,lineWidth: 8))
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .clipped()
                            .shadow(radius: 4)
                            .padding()
                            .offset(x: 0, y: -70)
                        Spacer()
                        
                        NavigationLink(destination: EditProfileView()) {
                            Image(systemName: "pencil")
                                .resizable()
                                .foregroundColor(Color("Text"))
                                .frame(width: 15, height: 15)
                                .padding(.trailing, 20)
                        }
                        
                        
                    }
                }.frame(height: 50)
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("\(name)")
                                .font(.avenirNext(size: 22))
                            Text("\(email)")
                                .font(.avenirNext(size: 14))
                                .foregroundColor(.gray)
                        }
                        VStack(alignment: .leading) {
                            Text("About")
                                .font(.avenirNext(size: 14))
                            Text("\(about)")
                                .font(.avenirNextRegular(size: 12))
                            
                            HStack(alignment: .center) {
                                Image("linkedin_icon")
                                    .resizable()
                                    .background(Color.white)
                                    .frame(width: 16, height: 16)
                                Text("LinkedIn")
                                    .font(.avenirNext(size: 14))
                            }
                            Text("\(linkedin)")
                                .font(.avenirNextRegular(size: 14))
                                .foregroundColor(.blue)
                            
                            HStack(alignment: .center) {
                                Image("github_icon")
                                    .resizable()
                                    .background(Color.white)
                                    .frame(width: 16, height: 16)
                                Text("Github")
                                    .font(.avenirNext(size: 14))
                            }
                            Text("\(github)")
                                .font(.avenirNextRegular(size: 14))
                                .foregroundColor(.blue)
                            
                            HStack(alignment: .center) {
                                Image("twitter_icon")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                Text("Twitter")
                                    .font(.avenirNext(size: 14))
                            }
                            Text("\(twitter)")
                                .font(.avenirNextRegular(size: 14))
                                .foregroundColor(.blue)
                        }
                        .padding(.vertical)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .statusBar(hidden: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
