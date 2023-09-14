//
//  CenterModifier.swift
//  Africa
//
//  Created by Abdul Wahib on 9/14/23.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
