//
//  ContentView.swift
//  sparrowsprint8
//
//  Created by Artem Dragunov on 21.12.2023.
//

import SwiftUI

struct ContentView: View {
    @State var percentage: Float = 50

    var body: some View {
        ZStack {
            Image("wallpaper")
                .resizable()
                .edgesIgnoringSafeArea(.all)

            Slider()
        }
    }
}

struct Slider: View {
    @State private var maxHeight: CGFloat = 250
    @State private var sliderHeight: CGFloat = 0
    @State private var lastDragValue: CGFloat = 0
    @State private var scaleEffect: CGFloat = 0
    private let maxScaleEffect: CGFloat = 0.15

    var body: some View {
        ZStack(alignment: .bottom) {
            Rectangle()
                .foregroundStyle(.ultraThinMaterial)
            Rectangle()
                .foregroundColor(.white)
                .frame(height: sliderHeight)
        }
        .frame(width: 80, height: maxHeight)
        .cornerRadius(25)
        .gesture(DragGesture(minimumDistance: 0)
            .onChanged({ value in
                let translation = value.translation

                sliderHeight = -translation.height + lastDragValue

                withAnimation {
                    if sliderHeight > maxHeight {
                        scaleEffect = min(maxScaleEffect, 1 - maxHeight / sliderHeight)
                    } else if sliderHeight < 0 {
                        scaleEffect = -min(maxScaleEffect, 1 - maxHeight / (maxHeight + abs(sliderHeight)))
                    } else {
                        scaleEffect = 0
                    }
                }
            })
            .onEnded({ value in
                sliderHeight = max(0, min(maxHeight, sliderHeight))
                lastDragValue = sliderHeight
                scaleEffect = 0
            }))
            .scaleEffect(
                CGSize(width: 1.0 - abs(scaleEffect) / 2, height: 1.0 + abs(scaleEffect)),
                anchor: scaleEffect >= 0 ? .bottom : .top
            )
    }
}

#Preview {
    ContentView()
}
