//
//  VideoModel.swift
//  Africa
//
//  Created by Abdul Wahib on 9/13/23.
//

import SwiftUI

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        return "video-\(id)"
    }
}
