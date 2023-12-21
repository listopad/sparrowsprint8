//
//  ContentView.swift
//  sparrowsprint8
//
//  Created by Artem Dragunov on 21.12.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("wallpaper")
                .resizable()
                .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    ContentView()
}
