//
//  SwiftUI_TutorialApp.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 8/2/23.
//

import SwiftUI
import SwiftData

@main
struct SwiftUI_TutorialApp: App {
    // MARK: - Properties
    @StateObject private var dataController = DataController()
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext )
        }
        .modelContainer(for: UserModel.self)
    }
}
