//
//  ContentView.swift
//  ARItems
//
//  Created by Efe Mazlumoğlu on 2.03.2022.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var models: [String] = ["AirForce", "PegasusTrail"]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer()
            ModelPickerView(models: self.models)
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

struct ModelPickerView: View {
    var models: [String]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(0 ..< self.models.count) {
                    index in
                    Button(action: {
                        print("DEBUG: selected model with the name: \(self.models[index])")
                    }) {
                        Image(uiImage: UIImage(named: self.models[index])!).resizable().frame(height: 80).aspectRatio(1/1, contentMode: .fit)
                            .background(Color.white)
                            .cornerRadius(12)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .padding(20)
        .background(Color.black).opacity(0.5)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
