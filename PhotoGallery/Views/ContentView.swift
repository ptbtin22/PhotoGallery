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
                Text("How empty is this?")
                    .font(.title3)
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
