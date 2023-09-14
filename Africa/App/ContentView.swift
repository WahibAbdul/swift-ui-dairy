//
//  ContentView.swift
//  Africa
//
//  Created by Abdul Wahib on 9/12/23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    //    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    @State private var isGridViewActive = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn = 2
    @State private var toolbarGridIcon = "square.grid.2x2"
    
    // MARK: - Functions
    func gridSwitch() {
        gridLayout = Array(repeating: GridItem(.flexible()), count: (gridColumn % 3) + 1)
        gridColumn = gridLayout.count
        
        switch gridColumn {
        case 1:
            toolbarGridIcon = "square.grid.2x2"
        case 2:
            toolbarGridIcon = "square.grid.3x2"
        case 3:
            toolbarGridIcon = "rectangle.grid.1x2"
        default:
            toolbarGridIcon = "square.grid.2x2"
        }
        
    }
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            Group {
                if isGridViewActive == false {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }//: LINK
                        }//: LOOP
                        CreditsView()
                            .modifier(CenterModifier())
                    }//:LIST
                } else {
                    ScrollView {
                        LazyVGrid(columns: gridLayout) {
                            ForEach(animals) { item in
                                NavigationLink(destination: AnimalDetailView(animal: item)) {
                                    AnimalGridItemView(animal: item)
                                }
                            }//:LOOP
                        }//: GRID
                        .padding(10)
                        .animation(.easeIn, value: UUID())
                    }//: SCROLLVIEW
                }//: CONDITION
            }//: GROUP
            .listStyle(.plain)
            .navigationTitle("Afria")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button {
                            isGridViewActive = false
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        Button {
                            haptics.impactOccurred()
                            isGridViewActive = true
                            gridSwitch()
                        } label: {
                            Image(systemName: toolbarGridIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }//: HSTACK
                }//: TOOLBARITEM
            }//: TOOLBAR
        }//: NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
