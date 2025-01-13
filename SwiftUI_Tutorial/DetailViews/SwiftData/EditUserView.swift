//
//  EditUserView.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 2/8/24.
//

import SwiftUI
import SwiftData

struct EditUserView: View {
    //MARK: - Properties
    @Bindable var user: UserModel

    //MARK: - Body
    var body: some View {
        Form {
            TextField("Name", text: $user.name)
            TextField("City", text: $user.city)
            DatePicker("Join Date", selection: $user.joinDate)
        }
        .navigationTitle("Edit User")
    }

}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: UserModel.self, configurations: config)
        let user = UserModel(name: "Muneeb", city: "Bangkok", joinDate: .now)

        return EditUserView(user: user)
            .modelContainer(container)
    } catch {
        return Text("Failed to create container: \(error.localizedDescription)")
    }
}
