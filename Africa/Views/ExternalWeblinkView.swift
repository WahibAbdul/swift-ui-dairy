//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Abdul Wahib on 9/12/23.
//

import SwiftUI

struct ExternalWeblinkView: View {
    // MARK: - Properties
    let animal: Animal
    // MARK: - Body
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                Group {
                    Link(animal.name, destination: URL(string: animal.link)
                         ?? URL(string: "https://www.wikipedia.org")!)
                    Image(systemName: "arrow.up.right.square")
                }//: GROUP
                .foregroundColor(.accentColor)
            }//: HSTACK
        }//: GROUPBOX
    }
}

// MARK: - Preview
struct ExternalWeblinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalWeblinkView(animal: animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
