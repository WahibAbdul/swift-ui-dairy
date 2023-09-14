//
//  SettingsLabelView.swift
//  Fructus
//
//  Created by Abdul Wahib on 9/11/23.
//

import SwiftUI

struct SettingsLabelView: View {
    var title: String
    var imageName: String
    var body: some View {
        HStack {
            Text(title.uppercased())
                .fontWeight(.bold)
            Spacer()
            Image(systemName: imageName)
        }
    }
}

struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(title: "Fructus", imageName: "info.circle")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
