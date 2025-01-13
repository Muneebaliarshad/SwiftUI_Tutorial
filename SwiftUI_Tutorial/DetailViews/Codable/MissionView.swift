//
//  MissionView.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 8/15/23.
//

import SwiftUI

struct MissionView: View {
    //MARK: - Properties
    var selectedMission: Mission
    var crew: [CrewMember]
    
    //MARK: - Init Methods
    init(selectedMission: Mission, astronauts: [String: Astronauts]) {
        self.selectedMission = selectedMission

        self.crew = selectedMission.crew!.map { member in
            if let astronaut = astronauts[member.name ?? ""] {
                return CrewMember(role: member.role, astronauts: astronaut)
            } else {
                fatalError("Missing \(member.name ?? "")")
            }
        }
    }
    
    //MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            ScrollView(showsIndicators: false) {
                VStack {
                    Image(selectedMission.image ?? "")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.lightBackground)
                        .padding(.vertical)
                    VStack(alignment: .leading) {
                        Text("Mission Hghlits")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        Text(selectedMission.description ?? "")
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(crew, id: \.role) { crewMember in
                                NavigationLink {
                                    AstronautView(astronaut: crewMember.astronauts!)
                                } label: {
                                    HStack {
                                        Image(crewMember.astronauts?.id ?? "")
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .clipShape(Capsule())
                                            .overlay {
                                                Capsule()
                                                    .strokeBorder(.white, lineWidth: 2)
                                            }
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text(crewMember.astronauts?.name ?? "")
                                                .foregroundColor(.white)
                                                .font(.headline)
                                            Text(crewMember.role ?? "")
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(selectedMission.displayName ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronauts] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(selectedMission: missions[0], astronauts: astronauts)
                    .preferredColorScheme(.dark)
    }
}

struct CrewMember {
    var role: String?
    var astronauts: Astronauts?
}
