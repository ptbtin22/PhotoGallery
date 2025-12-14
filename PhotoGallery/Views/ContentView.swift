//
//  ContentView.swift
//  PhotoGallery
//
//  Created by Tin Pham on 13/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                GridView(title: "Recents")
            }
            .tabItem {
                Label("Gallery", systemImage: "house")
            }

            NavigationStack {
                GridView(title: "Your Beloved")
            }
            .tabItem {
                Label("Favorites", systemImage: "heart")
            }
        }
        .tint(.red)
    }
}

#Preview {
    ContentView()
}
