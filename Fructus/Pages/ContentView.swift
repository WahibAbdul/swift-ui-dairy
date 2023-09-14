//
//  ContentView.swift
//  Fructus
//
//  Created by Abdul Wahib on 9/11/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    var fruits: [Fruit] = fruitsData
    @State private var isShowingSettings = false
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            List {
                ForEach(fruits.shuffled()) { fruit in
                    NavigationLink(destination: FruitDetailView(fruit: fruit)) {
                        FruitRowView(fruit: fruit)
                            .padding(.vertical, 4)
                    }//: NavigationLink
                }//:ForEach
            }//: List
            .navigationTitle("Fruits")
            .toolbar {
                Button {
                    isShowingSettings = true
                } label: {
                    Image(systemName: "slider.horizontal.3")
                }//: Button
                .sheet(isPresented: $isShowingSettings) {
                    SettingsView()
                }
            }//:Toolbar
        }//: Navigation
        .navigationViewStyle(.stack)
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
    }
}
