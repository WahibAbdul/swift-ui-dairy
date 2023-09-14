//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Abdul Wahib on 9/13/23.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: - Properties
    @State private var randomCirlce = Int.random(in: 12...16)
    @State private var isAnimating = false
    
    // MARK: - Functions
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    func randomSize(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    
    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCirlce, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .frame(width: randomSize(max: 256), height: randomSize(max: geometry.size.height), alignment: .center)
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                        )
                        .onAppear(perform: {
                            withAnimation(Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())) {
                                isAnimating = true
                            }
                        })
                        
                }//: LOOP
            }//: ZSTACK
            .drawingGroup() // Optimize Animations and saves battery, it renders content as still images instead of real time rendering
        }//: GEOMETRYREADER
    }
        
}

// MARK: - Preview
struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
