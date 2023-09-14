//
//  AnimalModel.swift
//  Africa
//
//  Created by Abdul Wahib on 9/12/23.
//

import SwiftUI

class Animal: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}
