//
//  FruitCardView.swift
//  Fructus
//
//  Created by Abdul Wahib on 9/11/23.
//

import SwiftUI

struct FruitCardView: View {
    // MARK: - Properties
    var fruit: Fruit
    @State private var isAnimating: Bool = false
    
    // MARK: - Body
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                // Fruit: Image
                Image(fruit.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: Color.black.opacity(0.15), radius: 5,x: 6, y: 8)
                    .scaleEffect(isAnimating ? 1.0 : 0.6)
                // Fruit: Title
                Text(fruit.title)
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .shadow(color: Color.black.opacity(0.15), radius: 2, x: 2, y: 2)
                // Fruit: Headline
                Text(fruit.headline)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 480)
                    .font(.headline)
                // Fruit: Button Start
                StartButton()
            } //: VStack
        } //: ZStack
        .onAppear{
            withAnimation(.easeOut(duration: 0.5)){
                isAnimating = true
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(LinearGradient(gradient: Gradient(colors: fruit.gradientColors), startPoint: .top, endPoint: .bottom))
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }
    
}

// MARK: Preview
#if DEBUG
struct FruitCardView_Previews: PreviewProvider {
    static var previews: some View {
        FruitCardView(fruit: fruitsData[1])
            .previewLayout(.fixed(width: 320, height: 640))
    }
}
#endif
