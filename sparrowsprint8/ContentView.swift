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
    private let sliderHeight: CGFloat = 200
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.ultraThinMaterial)
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
        }
        .frame(width: 80, height: sliderHeight)
        .gesture(DragGesture(minimumDistance: 0)
            .onChanged({ value in
                // Handle the drag gesture
            }))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
