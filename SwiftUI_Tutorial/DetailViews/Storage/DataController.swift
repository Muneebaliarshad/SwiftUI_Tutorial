//
//  DataController.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 9/8/23.
//

import Foundation
import CoreData


class DataController: ObservableObject {
    // MARK: - Properties
    let container = NSPersistentContainer(name: "UserData")
    
    // MARK: - Init Methods
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("CoreData fail to load: \(error)")
            }
        }
    }
}
