//
//  CodableExample.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 8/11/23.
//

import SwiftUI

struct CodableExample: View {
    //MARK: - Properties
    let astronautsData: [String: Astronauts] = Bundle.main.decode("astronauts.json")
    let missionsData: [Mission] = Bundle.main.decode("missions.json")
    var columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    //MARK: - Body
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missionsData) { mission in
                    NavigationLink {
                        MissionView(selectedMission: mission, astronauts: astronautsData)
                    } label: {
                        VStack {
                            Image(mission.image ?? "")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                                .padding()
                            VStack(spacing: 5) {
                                Text(mission.displayName ?? "")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.7))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        }
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
        .navigationTitle("Codable")
        .background(.darkBackground)
        .preferredColorScheme(.dark)
    }
}

struct CodableExample_Previews: PreviewProvider {
    static var previews: some View {
        CodableExample()
    }
}

