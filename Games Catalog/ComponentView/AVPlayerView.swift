//
//  SampleAVPlayerView.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 25/07/20.
//

import SwiftUI
import AVKit

struct AVPlayerView: View {
    
    private let player = AVPlayer(url: URL(string: "https://media.rawg.io/media/stories-640/5b0/5b0cfff8c606c5e4db4f74f108c4413b.mp4")!)
    
    var body: some View {
        VideoPlayer(player: player)
    }
}

struct SampleAVPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AVPlayerView()
    }
}
