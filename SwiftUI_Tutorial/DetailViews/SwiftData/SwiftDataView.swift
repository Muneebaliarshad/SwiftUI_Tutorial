//
//  SwiftDataView.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 2/8/24.
//

import SwiftUI
import SwiftData

struct SwiftDataView: View {
    //MARK: - Properties
    @Environment(\.modelContext) var modelContext
    @Query(sort: \UserModel.name) var users: [UserModel]
    @State private var path = [UserModel]()

    //MARK: - Body
    var body: some View {
        NavigationStack(path: $path) {
            List(users) { user in
                NavigationLink(value: user) {
                    Text(user.name)
                }
            }
            .navigationTitle("SwiftData")
            .navigationDestination(for: UserModel.self) { user in
                EditUserView(user: user)
            }
            .toolbar {
                Button("Add User", systemImage: "plus") {
                    let newUser = UserModel(name: "", city: "", joinDate: .now)
                    modelContext.insert(newUser)
                    path = [newUser] 
                }
            }
        }
    }
}

#Preview {
    SwiftDataView()
}
