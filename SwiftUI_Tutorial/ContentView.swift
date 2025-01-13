//
//  ContentView.swift
//  SwiftUI_Tutorial
//
//  Created by Muneeb Ali on 8/2/23.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    @State private var rows = ["Normal", "Stack", "Color", "Gradient", "Button", "Image", "Stepper", "Picker", "List", "Animation", "Gesture", "Srorage", "Views", "Navigation", "Codable", "Drawing Path", "Drawing Shape", "Spirograph", "API Calling", "Core Data", "Core Data 2", "Haptic Effects", "Swift Data", "Rating View", "Photo Library", "Dialog", "Content Unavailable"]

    //MARK: - Body
    var body: some View {
        NavigationView {
            Form {
                ForEach(rows, id: \.self) { row in
                    NavigationLink {
                        cellAction(row)
                    } label: {
                        Text(row)
                    }
                }
            }
            .navigationTitle("Swift UI")
        }
    }
    
    //MARK: - Cell Action
    @ViewBuilder
    func cellAction(_ selectedRow: String) -> some View {
        switch selectedRow {
        case rows[0]:
            NormalControls()
        case rows[1]:
            StackExample()
        case rows[2]:
            ColorExample()
        case rows[3]:
            GradientExample()
        case rows[4]:
            ButtonExample()
        case rows[5]:
            ImageExample()
        case rows[6]:
            StepperExample()
        case rows[7]:
            PickerExample()
        case rows[8]:
            ListExample()
        case rows[9]:
            AnimationExample()
        case rows[10]:
            GestureExample()
        case rows[11]:
            StorageExample()
        case rows[12]:
            ViewsExample()
        case rows[13]:
            NavigationExample()
        case rows[14]:
            CodableExample()
        case rows[15]:
            DrawingUsingPathView()
        case rows[16]:
            DrawingUsingShapeView()
        case rows[17]:
            SpirographView()
        case rows[18]:
            SongsDataView()
        case rows[19]:
            CoreDataView()
        case rows[20]:
            CodabeExample2()
        case rows[21]:
            HapticEffectsView()
        case rows[22]:
            SwiftDataView()
        case rows[23]:
            RatingView(rating: .constant(4))
        case rows[24]:
            PhotoLibrary()
        case rows[25]:
            DialogView()
        case rows[26]:
            NoContentView()
        default:
            NoView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
