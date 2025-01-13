//
//  RatingView.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 9/15/23.
//

import SwiftUI

struct RatingView: View {
    //MARK: - Properties
    @Binding var rating: Int
    var label = ""
    var maximumRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    var offColor = Color.gray
    var onColor = Color.yellow
    
    //MARK: - Body
    var body: some View {
        HStack {
            if label.isEmpty == false {
               Text(label)
            }
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
        .navigationTitle("Rating View")
    }
    
    //MARK: - Helper Method
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4))
    }
}
