//
//  AstronautView.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 8/15/23.
//

import SwiftUI

struct AstronautView: View {
    //MARK: - Properties
    let astronaut: Astronauts
    
    //MARK: - Body
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                Text(astronaut.description)
                    .padding()
                    .foregroundColor(.white)
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [String: Astronauts] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts["armstrong"]!)
    }
}
