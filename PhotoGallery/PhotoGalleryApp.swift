//
//  PhotoGalleryApp.swift
//  PhotoGallery
//
//  Created by Tin Pham on 13/12/25.
//

import SwiftUI
import CoreData

@main
struct PhotoGalleryApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
