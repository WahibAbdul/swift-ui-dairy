//
//  VideoPlayView.swift
//  Africa
//
//  Created by Abdul Wahib on 9/13/23.
//

import SwiftUI
import AVKit

struct VideoPlayView: View {
    // MARK: - Properties
    var videoSelected: String
    var videoTitle: String
    
    
    // MARK: - Body
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")) {
                //                Text(videoTitle)
            }//: VIDEOPLAYER
            .overlay(Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .padding(.top, 6)
                .padding(.horizontal, 8)
                     , alignment: .topLeading
            )
            
        }//: VSTACK
        .tint(.accentColor)
        .navigationTitle(videoTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Preview
struct VideoPlayView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayView(videoSelected: "lion", videoTitle: "Lion")
        }
    }
}
