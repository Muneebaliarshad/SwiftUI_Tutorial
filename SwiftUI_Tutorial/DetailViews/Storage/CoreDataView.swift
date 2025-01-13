//
//  CoreDataView.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 9/8/23.
//

import SwiftUI

struct CoreDataView: View {
    // MARK: - Properties
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var userData: FetchedResults<User>
    
    // MARK: - Body
    var body: some View {
        VStack {
            List(userData) { user in
                Text(user.name ?? "No Name")
            }
            HStack(spacing: 20) {
                Button("Add Data") {
                    let firstName = ["Herbie", "Vittoria", "Gunhilda", "Tatsuo", "Katerina"]
                    let lastName = ["Deirbhile", "Tadas", "Ségdae", "Dan", "Mehmut"]
                    
                    let selectedFirstName = firstName.randomElement()
                    let selectedLastName = lastName.randomElement()
                    
                    let user = User(context: moc)
                    user.id = UUID()
                    user.name = "\(selectedFirstName ?? "") \(selectedLastName ?? "")"
                    
                    try? moc.save()
                }
                .buttonStyle(.borderedProminent)
                .tint(.mint)
                Button("Delete Data", role: .destructive) {
                    if userData.count > 0 {
                        moc.delete(userData.last!)
                    }
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .navigationTitle("Core Data")
    }
}

struct CoreDataView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataView()
    }
}
