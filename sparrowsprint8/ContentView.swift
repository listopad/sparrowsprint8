//
//  ContentView.swift
//  sparrowsprint8
//
//  Created by Artem Dragunov on 21.12.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        @State var percentage: Float = 50
        
        ZStack {
            Image("wallpaper")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            Slider()
        }
    }
}

struct Slider: View {
    private let overlayHeight: CGFloat = 100;
    
    @State private var maxHeight: CGFloat = 250
    
    @State private var sliderProgress: CGFloat = 0
    @State private var sliderHeight: CGFloat = 0
    @State private var lastDragValue: CGFloat = 0
    
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
                
                sliderHeight = sliderHeight > maxHeight ? maxHeight : sliderHeight
                
                sliderHeight = sliderHeight >= 0 ? sliderHeight : 0
            })
                 
            .onEnded({ value in
                
                sliderHeight = sliderHeight > maxHeight ? maxHeight : sliderHeight
                
                sliderHeight = sliderHeight >= 0 ? sliderHeight : 0
                
                lastDragValue = sliderHeight
                
                
            }))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
