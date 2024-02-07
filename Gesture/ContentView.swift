//
//  ContentView.swift
//  Gesture
//
//  Created by 渡邊魁優 on 2024/02/07.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var rectAngle = ActiveRectAngle(
        sizes: [CGSize(width: 150, height: 80),
                CGSize(width: 200, height: 40),
                CGSize(width: 50, height: 250),
                CGSize(width: 220, height: 100),
                CGSize(width: 90, height: 90)])
    
    var body: some View {
        VStack {
            Spacer()
            Rectangle()
                .foregroundStyle(rectAngle.color)
                .frame(
                    width: rectAngle.size.width,
                    height: rectAngle.size.height
                )
                .offset(rectAngle.offset)
                .gesture(rectAngle.dragGesture)
                .gesture(rectAngle.rotationGesture)
                .gesture(rectAngle.longPressGesture)
                .gesture(rectAngle.tapGesture)
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
