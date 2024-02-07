//
//  Gestures.swift
//  Gesture
//
//  Created by 渡邊魁優 on 2024/02/07.
//

import SwiftUI

class ActiveRectAngle: ObservableObject {
    @Published var color: Color
    @Published var rotation: Angle
    @Published var offset: CGSize
    @Published var sizeIndex: Int
    @Published var sizes: [CGSize]
    var size: CGSize {
        get {
            return sizes[sizeIndex]
        }
    }
    
    init(sizes: [CGSize]) {
        self.color = Color.blue
        self.rotation = Angle.zero
        self.offset = CGSize.zero
        self.sizeIndex = 0
        self.sizes = sizes
    }
    
    var tapGesture: some Gesture {
        TapGesture()
            .onEnded {
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
                    self.sizeIndex += 1
                    if self.sizeIndex == self.sizes.count {
                        self.sizeIndex = 0
                    }
                }
            }
    }
    var rotationGesture: some Gesture {
        RotationGesture()
            .onChanged{ angle in
                self.rotation = angle
            }
            .onEnded { angle in
                self.rotation = angle
            }
    }
    
    var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                print("Drag")
                self.offset = CGSize(
                    width: value.startLocation.x + value.translation.width - self.size.width/2,
                    height: value.startLocation.y + value.translation.height - self.size.height/2
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
