//
//  SongsDataView.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 9/6/23.
//

import SwiftUI

struct SongsDataView: View {
    // MARK: - Properties
    @State private var results = [Result]()
    
    //MARK: - Body
    var body: some View {
        List(results, id: \.trackId) { item in
            HStack {
                AsyncImage(url: URL(string: item.artworkUrl100))
                    .frame(width: 100, height: 100)
                VStack(alignment: .leading) {
                    Text(item.trackName)
                        .font(.headline)
                    Text(item.collectionName)
                }
            }
            
        }
        .task {
            await loadData()
        }
        .navigationTitle("API Calling")
    }
    
    // MARK: - API Calling
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=talha+anjum&entity=song") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Songs.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct SongsDataView_Previews: PreviewProvider {
    static var previews: some View {
        SongsDataView()
    }
}
