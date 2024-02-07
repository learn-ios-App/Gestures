//
//  Gestures.swift
//  Gesture
//
//  Created by 渡邊魁優 on 2024/02/07.
//

import SwiftUI

struct ActiveRectAngle {
    @State var color: Color = Color.primary
    @State var rotation = Angle.zero
    @State var offset = CGSize.zero
    @State var sizeIndex = 0
    var sizes: [CGSize]
    var size: CGSize {
        get {
            return sizes[sizeIndex]
        }
    }
    
    var tapGesture: some Gesture {
        TapGesture()
            .onEnded {
                print("Tap")
                withAnimation {
                    self.color = Color.random()
                }
            }
    }
    
    var longPressGesture: some Gesture {
        LongPressGesture()
            .onEnded { value in
                print("LongTap")
                withAnimation {
                    sizeIndex += 1
                    if sizeIndex == sizes.count {
                        sizeIndex = 0
                    }
                }
            }
    }
    var rotationGesture: some Gesture {
        RotationGesture()
            .onChanged{ angle in
                rotation = angle
            }
            .onEnded { angle in
                rotation = angle
            }
    }
    
    var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                print("Drag")
                offset = CGSize(
                    width: value.startLocation.x + value.translation.width - size.width/2,
                    height: value.startLocation.y + value.translation.height - size.height/2
                )
            }
    }
}

extension Color {
    static func random() -> Color {
        return Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
}
